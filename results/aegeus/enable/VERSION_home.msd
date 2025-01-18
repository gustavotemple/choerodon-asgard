service=ScheduleTaskProjectController
operation=ScheduleTaskProjectController::setScheduleTaskService
params=[scheduleTaskService:ScheduleTaskService]
output=void
using-types=[ScheduleTaskService]

operation=ScheduleTaskProjectController::create
params=[projectId:Long, dto:ScheduleTask]
output=ResponseEntity<QuartzTaskDTO>
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskValidator, ScheduleTask, ScheduleTaskService, Long, HttpStatus]

operation=ScheduleTaskProjectController::enable
params=[projectId:Long, id:Long, objectVersionNumber:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskService, Long]

operation=ScheduleTaskProjectController::disable
params=[projectId:Long, id:Long, objectVersionNumber:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskService, Long]

operation=ScheduleTaskProjectController::delete
params=[projectId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskService, Long]

operation=ScheduleTaskProjectController::pagingQuery
params=[projectId:Long, pageRequest:PageRequest, status:String, name:String, description:String, params:String]
output=ResponseEntity<Page<QuartzTask>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleTaskService, PageRequest, String, Long]

operation=ScheduleTaskProjectController::getTaskDetail
params=[projectId:Long, id:Long]
output=ResponseEntity<ScheduleTaskDetail>
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskService, Long, HttpStatus]

operation=ScheduleTaskProjectController::disableByProjectId
params=[projectId:Long]
output=void
using-types=[ScheduleTaskService, ResourceLevel, Long]

operation=ScheduleTaskProjectController::check
params=[projectId:Long, name:String]
output=ResponseEntity<Void>
using-types=[ResourceLevel, InitRoleCode, ScheduleTaskService, String, HttpStatus]

operation=ScheduleTaskProjectController::cron
params=[projectId:Long, cron:String]
output=ResponseEntity<List<String>>
using-types=[ResourceLevel, InitRoleCode, TriggerUtils, String, HttpStatus]


service=ScheduleMethodProjectController
operation=ScheduleMethodProjectController::setScheduleMethodService
params=[scheduleMethodService:ScheduleMethodService]
output=void
using-types=[ScheduleMethodService]

operation=ScheduleMethodProjectController::pagingQuery
params=[projectId:Long, code:String, service:String, method:String, description:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleMethodInfo>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleMethodService, PageRequest, String]

operation=ScheduleMethodProjectController::getMethodByService
params=[projectId:Long, service:String]
output=ResponseEntity<List<ScheduleMethod>>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, String, HttpStatus]

operation=ScheduleMethodProjectController::getParams
params=[projectId:Long, id:Long]
output=ResponseEntity<ScheduleMethodParams>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, Long, HttpStatus]

operation=ScheduleMethodProjectController::getServices
params=[projectId:Long]
output=ResponseEntity<List<String>>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, HttpStatus]


service=SagaTaskInstanceProjController
operation=SagaTaskInstanceProjController::setSagaTaskInstanceService
params=[sagaTaskInstanceService:SagaTaskInstanceService]
output=void
using-types=[SagaTaskInstanceService]

operation=SagaTaskInstanceProjController::unlockById
params=[projectId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceProjController::forceFailed
params=[projectId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceProjController::unlockByInstance
params=[projectId:Long, instance:String]
output=void
using-types=[ResourceLevel, InitRoleCode, StringUtils, String, SagaTaskInstanceService]

operation=SagaTaskInstanceProjController::retry
params=[projectId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceProjController::retrySagaTask
params=[projectId:Long, ids:List<Long>]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long, List]

operation=SagaTaskInstanceProjController::pagingQuery
params=[projectId:Long, taskInstanceCode:String, sagaInstanceCode:String, status:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<SagaTaskInstanceInfo>>
using-types=[ResourceLevel, InitRoleCode, Sort, SagaTaskInstanceService, PageRequest, String, Long]


service=ScheduleMethodOrgController
operation=ScheduleMethodOrgController::setScheduleMethodService
params=[scheduleMethodService:ScheduleMethodService]
output=void
using-types=[ScheduleMethodService]

operation=ScheduleMethodOrgController::pagingQuery
params=[orgId:Long, code:String, service:String, method:String, description:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleMethodInfo>>
using-types=[ResourceLevel, Sort, ScheduleMethodService, PageRequest, String]

operation=ScheduleMethodOrgController::getMethodByService
params=[orgId:Long, service:String]
output=ResponseEntity<List<ScheduleMethod>>
using-types=[ResourceLevel, ScheduleMethodService, String, HttpStatus]

operation=ScheduleMethodOrgController::getParams
params=[orgId:Long, id:Long]
output=ResponseEntity<ScheduleMethodParams>
using-types=[ResourceLevel, ScheduleMethodService, Long, HttpStatus]

operation=ScheduleMethodOrgController::getServices
params=[orgId:Long]
output=ResponseEntity<List<String>>
using-types=[ResourceLevel, ScheduleMethodService, HttpStatus]


service=ScheduleTaskOrgController
operation=ScheduleTaskOrgController::setScheduleTaskService
params=[scheduleTaskService:ScheduleTaskService]
output=void
using-types=[ScheduleTaskService]

operation=ScheduleTaskOrgController::create
params=[orgId:Long, dto:ScheduleTask]
output=ResponseEntity<QuartzTaskDTO>
using-types=[ResourceLevel, ScheduleTaskValidator, ScheduleTask, ScheduleTaskService, Long, HttpStatus]

operation=ScheduleTaskOrgController::enable
params=[orgId:Long, id:Long, objectVersionNumber:Long]
output=void
using-types=[ResourceLevel, ScheduleTaskService, Long]

operation=ScheduleTaskOrgController::disable
params=[orgId:Long, id:Long, objectVersionNumber:Long]
output=void
using-types=[ResourceLevel, ScheduleTaskService, Long]

operation=ScheduleTaskOrgController::disableByOrganizationId
params=[orgId:Long]
output=void
using-types=[ScheduleTaskService, ResourceLevel, Long]

operation=ScheduleTaskOrgController::delete
params=[orgId:Long, id:Long]
output=void
using-types=[ResourceLevel, ScheduleTaskService, Long]

operation=ScheduleTaskOrgController::pagingQuery
params=[orgId:Long, status:String, name:String, description:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<QuartzTask>>
using-types=[ResourceLevel, Sort, ScheduleTaskService, PageRequest, String, Long]

operation=ScheduleTaskOrgController::getTaskDetail
params=[orgId:Long, id:Long]
output=ResponseEntity<ScheduleTaskDetail>
using-types=[ResourceLevel, ScheduleTaskService, Long, HttpStatus]

operation=ScheduleTaskOrgController::check
params=[orgId:Long, name:String]
output=ResponseEntity<Void>
using-types=[ResourceLevel, ScheduleTaskService, String, HttpStatus]

operation=ScheduleTaskOrgController::cron
params=[orgId:Long, cron:String]
output=ResponseEntity<List<String>>
using-types=[ResourceLevel, TriggerUtils, String, HttpStatus]


service=ScheduleTaskSiteController
operation=ScheduleTaskSiteController::setScheduleTaskService
params=[scheduleTaskService:ScheduleTaskService]
output=void
using-types=[ScheduleTaskService]

operation=ScheduleTaskSiteController::create
params=[dto:ScheduleTask]
output=ResponseEntity<QuartzTaskDTO>
using-types=[ScheduleTaskValidator, ScheduleTask, ScheduleTaskService, ResourceLevel, HttpStatus]

operation=ScheduleTaskSiteController::disable
params=[id:Long, objectVersionNumber:Long]
output=void
using-types=[ScheduleTaskService, Long, ResourceLevel]

operation=ScheduleTaskSiteController::delete
params=[id:Long]
output=void
using-types=[ScheduleTaskService, Long, ResourceLevel]

operation=ScheduleTaskSiteController::deleteByName
params=[name:String]
output=void
using-types=[ScheduleTaskService, String, ResourceLevel]

operation=ScheduleTaskSiteController::pagingQuery
params=[pageRequest:PageRequest, status:String, name:String, description:String, params:String]
output=ResponseEntity<Page<QuartzTask>>
using-types=[Sort, ScheduleTaskService, PageRequest, String, ResourceLevel]

operation=ScheduleTaskSiteController::getTaskDetail
params=[id:Long]
output=ResponseEntity<ScheduleTaskDetail>
using-types=[ScheduleTaskService, Long, ResourceLevel, HttpStatus]

operation=ScheduleTaskSiteController::check
params=[name:String]
output=ResponseEntity<Void>
using-types=[ScheduleTaskService, String, HttpStatus]

operation=ScheduleTaskSiteController::cron
params=[cron:String]
output=ResponseEntity<List<String>>
using-types=[TriggerUtils, String, HttpStatus]


service=ScheduleTaskSite2Controller
operation=ScheduleTaskSite2Controller::setScheduleTaskService
params=[scheduleTaskService:ScheduleTaskService]
output=void
using-types=[ScheduleTaskService]

operation=ScheduleTaskSite2Controller::enable
params=[id:Long, objectVersionNumber:Long]
output=void
using-types=[ScheduleTaskService, Long, ResourceLevel]


service=SagaCheckStatusController
operation=SagaCheckStatusController::pagingQuery
params=[tenantId:Long, projectCode:String]
output=ResponseEntity<Boolean>
using-types=[Results, SagaCheckStatusService, Long, String]


service=SagaController
operation=SagaController::setSagaService
params=[sagaService:SagaService]
output=void
using-types=[SagaService]

operation=SagaController::pagingQuery
params=[pageRequest:PageRequest, code:String, description:String, service:String, params:String]
output=ResponseEntity<Page<Saga>>
using-types=[ResourceLevel, InitRoleCode, Sort, SagaService, PageRequest, String]

operation=SagaController::query
params=[id:Long]
output=ResponseEntity<SagaWithTask>
using-types=[ResourceLevel, InitRoleCode, SagaService, Long]

operation=SagaController::delete
params=[id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaService, Long]

operation=SagaController::refresh
params=[serviceName:String]
output=ResponseEntity<Void>
using-types=[SagaService, String, Results]

operation=SagaController::cleanRecord
params=[]
output=ResponseEntity<Void>
using-types=[CleanSagaInstanceTimer, Results]


service=ScheduleMethodSiteController
operation=ScheduleMethodSiteController::setScheduleMethodService
params=[scheduleMethodService:ScheduleMethodService]
output=void
using-types=[ScheduleMethodService]

operation=ScheduleMethodSiteController::pagingQuery
params=[code:String, service:String, method:String, description:String, level:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleMethodInfo>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleMethodService, PageRequest, String]

operation=ScheduleMethodSiteController::getMethodByService
params=[service:String]
output=ResponseEntity<List<ScheduleMethod>>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, String, HttpStatus]

operation=ScheduleMethodSiteController::getParams
params=[id:Long]
output=ResponseEntity<ScheduleMethodParams>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, Long, HttpStatus]

operation=ScheduleMethodSiteController::getServices
params=[]
output=ResponseEntity<List<String>>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, HttpStatus]

operation=ScheduleMethodSiteController::getMethodIdByCode
params=[code:String]
output=ResponseEntity<Long>
using-types=[ScheduleMethodService, String, HttpStatus]

operation=ScheduleMethodSiteController::delete
params=[id:Long]
output=ResponseEntity<Void>
using-types=[ResourceLevel, InitRoleCode, ScheduleMethodService, Long, HttpStatus]


service=ScheduleTaskInstanceSiteController
operation=ScheduleTaskInstanceSiteController::setScheduleTaskInstanceService
params=[scheduleTaskInstanceService:ScheduleTaskInstanceService]
output=void
using-types=[ScheduleTaskInstanceService]

operation=ScheduleTaskInstanceSiteController::pagingQuery
params=[status:String, taskName:String, exceptionMessage:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstance>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleTaskInstanceService, PageRequest, String]

operation=ScheduleTaskInstanceSiteController::pagingQueryByTaskId
params=[taskId:Long, status:String, serviceInstanceId:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstanceLog>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleTaskInstanceService, PageRequest, Long, String, HttpStatus]

operation=ScheduleTaskInstanceSiteController::pollBatch
params=[dto:PollScheduleInstanceDTO]
output=ResponseEntity<Set<PollScheduleTaskInstance>>
using-types=[ScheduleTaskInstanceService, PollScheduleInstanceDTO, HttpStatus]

operation=ScheduleTaskInstanceSiteController::updateStatus
params=[id:Long, statusDTO:UpdateStatusDTO]
output=void
using-types=[UpdateStatusDTO, Long, ScheduleTaskInstanceService]


service=SagaTaskInstanceController
operation=SagaTaskInstanceController::setSagaTaskInstanceService
params=[sagaTaskInstanceService:SagaTaskInstanceService]
output=void
using-types=[SagaTaskInstanceService]

operation=SagaTaskInstanceController::pollBatch
params=[pollBatchDTO:PollSagaTaskInstanceDTO]
output=ResponseEntity<Set<SagaTaskInstance>>
using-types=[PollSagaTaskInstanceDTO, SagaTaskInstanceService, HttpStatus]

operation=SagaTaskInstanceController::updateStatus
params=[id:Long, statusDTO:SagaTaskInstanceStatus]
output=ResponseEntity<String>
using-types=[SagaTaskInstanceStatus, Long, Results, SagaTaskInstanceService]

operation=SagaTaskInstanceController::updateStatusFailureCallback
params=[id:Long, status:String]
output=void
using-types=[SagaTaskInstanceService, Long, String]

operation=SagaTaskInstanceController::query
params=[id:Long]
output=SagaTaskInstance
using-types=[SagaTaskInstanceService, Long]

operation=SagaTaskInstanceController::forceFailed
params=[id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceController::unlockById
params=[id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceController::unlockByInstance
params=[instance:String]
output=void
using-types=[ResourceLevel, InitRoleCode, StringUtils, String, SagaTaskInstanceService]

operation=SagaTaskInstanceController::retry
params=[id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceController::pagingQuery
params=[taskInstanceCode:String, sagaInstanceCode:String, status:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<SagaTaskInstanceInfo>>
using-types=[ResourceLevel, InitRoleCode, Sort, SagaTaskInstanceService, PageRequest, String]


service=ScheduleTaskController
operation=ScheduleTaskController::setScheduleTaskService
params=[scheduleTaskService:ScheduleTaskService]
output=void
using-types=[ScheduleTaskService]

operation=ScheduleTaskController::createByServiceCodeAndMethodCode
params=[sourceLevel:String, sourceId:Long, dto:ScheduleTask]
output=ResponseEntity<QuartzTaskDTO>
using-types=[ScheduleTaskValidator, ScheduleTask, ScheduleTaskService, String, Long, HttpStatus]

operation=ScheduleTaskController::deleteByTaskName
params=[sourceLevel:String, sourceId:Long, taskName:String]
output=ResponseEntity
using-types=[ScheduleTaskService, String, Long, Results]

operation=ScheduleTaskController::deleteByIds
params=[ids:List<Long>]
output=ResponseEntity<Void>
using-types=[ScheduleTaskService, List, HttpStatus]


service=SagaTaskInstanceOrgController
operation=SagaTaskInstanceOrgController::setSagaTaskInstanceService
params=[sagaTaskInstanceService:SagaTaskInstanceService]
output=void
using-types=[SagaTaskInstanceService]

operation=SagaTaskInstanceOrgController::unlockById
params=[orgId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceOrgController::forceFailed
params=[orgI:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceOrgController::unlockByInstance
params=[orgId:Long, instance:String]
output=void
using-types=[ResourceLevel, InitRoleCode, StringUtils, String, SagaTaskInstanceService]

operation=SagaTaskInstanceOrgController::retry
params=[orgId:Long, id:Long]
output=void
using-types=[ResourceLevel, InitRoleCode, SagaTaskInstanceService, Long]

operation=SagaTaskInstanceOrgController::pagingQuery
params=[pageRequest:PageRequest, orgId:Long, taskInstanceCode:String, sagaInstanceCode:String, status:String, params:String]
output=ResponseEntity<Page<SagaTaskInstanceInfo>>
using-types=[ResourceLevel, InitRoleCode, Sort, SagaTaskInstanceService, PageRequest, String, Long]


service=ScheduleTaskInstanceOrgController
operation=ScheduleTaskInstanceOrgController::setScheduleTaskInstanceService
params=[scheduleTaskInstanceService:ScheduleTaskInstanceService]
output=void
using-types=[ScheduleTaskInstanceService]

operation=ScheduleTaskInstanceOrgController::pagingQuery
params=[orgId:Long, status:String, taskName:String, exceptionMessage:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstance>>
using-types=[ResourceLevel, Sort, ScheduleTaskInstanceService, PageRequest, String, Long]

operation=ScheduleTaskInstanceOrgController::pagingQueryByTaskId
params=[orgId:Long, taskId:Long, status:String, serviceInstanceId:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstanceLog>>
using-types=[ResourceLevel, Sort, ScheduleTaskInstanceService, PageRequest, Long, String, HttpStatus]


service=ScheduleTaskInstanceProjectController
operation=ScheduleTaskInstanceProjectController::setScheduleTaskInstanceService
params=[scheduleTaskInstanceService:ScheduleTaskInstanceService]
output=void
using-types=[ScheduleTaskInstanceService]

operation=ScheduleTaskInstanceProjectController::pagingQuery
params=[projectId:long, status:String, taskName:String, exceptionMessage:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstance>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleTaskInstanceService, PageRequest, String, PrimitiveTypeUsage{name='long'}]

operation=ScheduleTaskInstanceProjectController::pagingQueryByTaskId
params=[projectId:Long, taskId:Long, status:String, serviceInstanceId:String, params:String, pageRequest:PageRequest]
output=ResponseEntity<Page<ScheduleTaskInstanceLog>>
using-types=[ResourceLevel, InitRoleCode, Sort, ScheduleTaskInstanceService, PageRequest, Long, String, HttpStatus]


service=SagaTaskInstanceV2Controller
operation=SagaTaskInstanceV2Controller::setSagaTaskInstanceService
params=[sagaTaskInstanceService:SagaTaskInstanceService]
output=void
using-types=[SagaTaskInstanceService]

operation=SagaTaskInstanceV2Controller::pollBatch
params=[pollBatchDTO:PollSagaTaskInstanceDTO]
output=DeferredResult<ResponseEntity<Set<SagaTaskInstance>>>
using-types=[Logger, PollSagaTaskInstanceDTO, SagaTaskInstanceService, Exception, Long, DeferredResult, ConcurrentHashMap, HttpStatus, SagaInstanceHandler, SagaInstanceEventPublisher, CollectionUtils, Set]


service=ScheduleTaskInstanceSiteV2Controller
operation=ScheduleTaskInstanceSiteV2Controller::setScheduleTaskInstanceService
params=[scheduleTaskInstanceService:ScheduleTaskInstanceService]
output=void
using-types=[ScheduleTaskInstanceService]

operation=ScheduleTaskInstanceSiteV2Controller::pollBatch
params=[dto:PollScheduleInstanceDTO]
output=DeferredResult<ResponseEntity<Set<PollScheduleTaskInstance>>>
using-types=[Logger, PollScheduleInstanceDTO, Long, DeferredResult, ConcurrentHashMap, HttpStatus, SagaInstanceHandler, SagaInstanceEventPublisher, ScheduleTaskInstanceService, CollectionUtils, Set]

