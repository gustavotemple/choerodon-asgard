package choerodon

import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.UUID
import scala.concurrent.duration._

class AsgardTest extends Simulation {

  private val title = "choerodon-test"

  //Saga Instance Domain
  private val postCreateSagaInstanceRequest = "POST create-saga-instance"
  private val getOneSagaInstanceRequest = "GET one-saga-instance"
  private val getSagaInstanceDetailsRequest = "GET saga-instance-details"
  private val getListSagaInstancesRequest = "GET list-saga-instances"
  private val putCancelSagaInstanceRequest = "PUT cancel-saga-instance"

  //Schedule Task Domain
  private val postCreateScheduleTaskRequest = "POST create-schedule-task (cpu)"
  private val getOneScheduleTaskRequest = "GET one-schedule-task"
  private val getListScheduleTasksRequest = "GET list-schedule-tasks (cpu/mem)"
  private val putDisableScheduleTaskRequest = "PUT disable-schedule-task (mem)"
  private val putEnableScheduleTaskRequest = "PUT enable-schedule-task (cpu/mem)"
  private val deleteScheduleTaskRequest = "DEL delete-schedule-task"

  private val postCreateSagaInstance =
    http(postCreateSagaInstanceRequest)
      .post("/sagas/instances")
      .header("Content-Type", "application/json")
      .body(StringBody(
        """
          |{
          |    "level": "organization",
          |    "refId": "#{timestamp}",
          |    "refType": "project",
          |    "sagaCode": "iam-create-project",
          |    "uuid": "#{saga-instance-uuid}",
          |    "service": "gatling"
          |}
        """.stripMargin))
      .check(substring("failed").notExists)
      .check(jmesPath("id").saveAs("saga-instance-id"))

  private val getOneSagaInstance =
    http(getOneSagaInstanceRequest)
      .get("/sagas/instances/#{saga-instance-id}")
      .check(substring("failed").notExists)

  private val getSagaInstanceDetails =
    http(getSagaInstanceDetailsRequest)
      .get("/sagas/instances/#{saga-instance-id}/details")
      .check(bodyBytes.exists)

  private val getListSagaInstances =
    http(getListSagaInstancesRequest)
      .get("/sagas/instances")
      .check(jmesPath("empty").is("false"))

  private val putCancelSagaInstance =
    http(putCancelSagaInstanceRequest)
      .put("/sagas/instances/#{saga-instance-uuid}/cancel")
      .check(status.is(200))

  private val circularScheduleTaskValues = Array(
    Map("schedule-task-id" -> "584909188166205440"),
    Map("schedule-task-id" -> "584909283611787264"),
    Map("schedule-task-id" -> "584909315459137536"),
    Map("schedule-task-id" -> "584909345284833280"),
    Map("schedule-task-id" -> "584909374389108736"),
  ).circular

  private val postCreateScheduleTask =
    http(postCreateScheduleTaskRequest)
      .post("/schedules/tasks")
      .header("Content-Type", "application/json")
      .body(StringBody(
        """
          |{
          |    "methodCode": "fixSagaData",
          |    "methodId": 584867801471266816,
          |    "name": "name#{randomInt}",
          |    "simpleRepeatCount": 10,
          |    "simpleRepeatInterval": 1,
          |    "simpleRepeatIntervalUnit": "HOURS",
          |    "triggerType": "simple-trigger",
          |    "startTimeStr": "#{startTimeStr}"
          |}
        """.stripMargin))
      .check(substring("failed").notExists)
      .check(jmesPath("id").saveAs("schedule-task-id"))

  private val getOneScheduleTask =
    http(getOneScheduleTaskRequest)
      .get("/schedules/tasks/#{schedule-task-id}")
      //.check(status.is(200))
      .check(substring("failed").notExists)

  private val getListScheduleTasks =
    http(getListScheduleTasksRequest)
      .get("/schedules/tasks")
      .check(jmesPath("empty").is("false"))

  private val putDisableScheduleTask =
    http(putDisableScheduleTaskRequest)
      .put("/schedules/tasks/#{schedule-task-id}/disable?objectVersionNumber=1")
      //.check(status.is(200))
      .check(bodyString.transform(_.isEmpty).is(true))

  private val putEnableScheduleTask =
    http(putEnableScheduleTaskRequest)
      .put("/schedules/tasks/#{schedule-task-id}/enable?objectVersionNumber=2")
      .check(bodyString.transform(_.isEmpty).is(true))

  private val deleteScheduleTask =
    http(deleteScheduleTaskRequest)
      .delete("/schedules/tasks/#{schedule-task-id}")
      //.check(status.is(200))
      .check(bodyString.transform(_.isEmpty).is(true))

  private val asgard: ScenarioBuilder = scenario(title)
    .group("Saga Instance") {
      exec(session => {
        val timestamp = System.currentTimeMillis().toString
        session.set("timestamp", timestamp)
      })
        .exec(session => {
          val uuid: String = UUID.randomUUID().toString.replace("-", "")
          session.set("saga-instance-uuid", uuid)
        })
        .exec(postCreateSagaInstance)
        .pause(2)
        .exec(getOneSagaInstance)
        .exec(getSagaInstanceDetails)
        .exec(getListSagaInstances)
        .exec(putCancelSagaInstance)
    }
    .group("Schedule Task") {
      exec(session => {
        val randomInt: String = scala.util.Random.nextInt(1000000000).toString
        session.set("randomInt", randomInt)
      })
        .exec(session => {
          val currentDate = LocalDateTime.now()
          val formattedDate = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
          session.set("startTimeStr", formattedDate)
        })
        .feed(circularScheduleTaskValues)
        .exec(postCreateScheduleTask)
        .pause(2)
        .exec(getOneScheduleTask)
        .exec(getListScheduleTasks)
        .exec(putDisableScheduleTask)
        .pause(1)
        .exec(putEnableScheduleTask)
        .pause(1)
        .exec(deleteScheduleTask)
    }

  val protocolReqres: HttpProtocolBuilder = http
    .baseUrl("http://127.0.0.1:8040/v1")
    .disableCaching
  setUp(
    asgard
      .inject(
        rampUsers(120) during (60 seconds),
        constantUsersPerSec(8) during (540 seconds)
      )
  ).protocols(protocolReqres)
    .assertions(
      global.successfulRequests.percent.gte(99)
    )
}

// sbt clean compile
// sbt "gatling:testOnly gatling.AsgardTest"
