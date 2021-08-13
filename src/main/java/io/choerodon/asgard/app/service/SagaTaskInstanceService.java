package io.choerodon.asgard.app.service;

import io.choerodon.asgard.api.vo.PageSagaTaskInstance;
import io.choerodon.asgard.api.vo.SagaTaskInstance;
import io.choerodon.asgard.api.vo.SagaTaskInstanceInfo;
import io.choerodon.asgard.api.vo.SagaTaskInstanceStatus;
import io.choerodon.asgard.saga.dto.PollSagaTaskInstanceDTO;
import io.choerodon.core.domain.Page;
import io.choerodon.mybatis.pagehelper.domain.PageRequest;

import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Set;

public interface SagaTaskInstanceService {

    Set<SagaTaskInstance> pollBatch(final PollSagaTaskInstanceDTO pollBatchDTO);

    String updateStatus(SagaTaskInstanceStatus statusDTO);

    void updateStatusFailureCallback(Long sagaTaskInstanceId, String status);

    SagaTaskInstance query(long id);

    void unlockByInstance(String instance);

    void retry(long id);

    void unlockById(long id);

    void forceFailed(long id);

    ResponseEntity<Page<SagaTaskInstanceInfo>> pageQuery(PageRequest pageable, String taskInstanceCode, String sagaInstanceCode, String status, String params, String level, Long sourceId);


    /**
     * 被锁住超过两小时的实例更新状态为失败
     *
     * @param pollBatchDTO
     */
    void failedLockedInstance(PollSagaTaskInstanceDTO pollBatchDTO);

    void retrySagaTask(Long projectId, List<Long> ids);
}
