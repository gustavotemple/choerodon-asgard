package io.choerodon.asgard.app.service.impl;

import io.choerodon.asgard.app.service.SagaTaskService;
import io.choerodon.asgard.infra.dto.SagaTaskDTO;
import io.choerodon.asgard.infra.mapper.SagaTaskMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class SagaTaskServiceImpl implements SagaTaskService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SagaTaskService.class);

    private SagaTaskMapper sagaTaskMapper;

    public SagaTaskServiceImpl(SagaTaskMapper sagaTaskMapper) {
        this.sagaTaskMapper = sagaTaskMapper;
    }

    @Override
    public void createSagaTaskList(final List<SagaTaskDTO> sagaTaskList, final String service) {
        if (CollectionUtils.isEmpty(sagaTaskList) || StringUtils.isEmpty(service)) {
            LOGGER.info("No Saga Task event for service:{}", service);
            return;
        }
        List<SagaTaskDTO> copyTaskList = new ArrayList<>(sagaTaskList);
        SagaTaskDTO serviceSagaTask = new SagaTaskDTO();
        serviceSagaTask.setService(service);
        List<SagaTaskDTO> dbTasks = sagaTaskMapper.select(serviceSagaTask);
        List<SagaTaskDTO> updateDbTask = new ArrayList<>();
        updateDbTask.addAll(dbTasks);
        sagaTaskList.forEach(i -> {
            if (StringUtils.isEmpty(i.getCode()) || StringUtils.isEmpty(i.getService()) || i.getSeq() == null) {
                return;
            }
            SagaTaskDTO dbSagaTask = findByCode(dbTasks, i.getSagaCode(), i.getCode());
            if (dbSagaTask == null) {
                i.setIsEnabled(true);
                if (sagaTaskMapper.insertSelective(i) != 1) {
                    LOGGER.error("insert saga task error: {}", i);
                } else {
                    dbTasks.add(i);
                    LOGGER.info("insert saga task: {}", i);
                }
            } else {
                i.setId(dbSagaTask.getId());
                i.setIsEnabled(true);
                i.setObjectVersionNumber(dbSagaTask.getObjectVersionNumber());
                if (sagaTaskMapper.updateByPrimaryKeySelective(i) == 1) {
                    LOGGER.info("update saga task: {}", i);
                }
            }
        });
        disableSagaTask(updateDbTask, copyTaskList);
    }

    private void disableSagaTask(final List<SagaTaskDTO> dbTasks, final List<SagaTaskDTO> sagaTaskList) {
        dbTasks.stream().filter(t -> t.getIsEnabled() && findByCode(sagaTaskList, t.getSagaCode(), t.getCode()) == null).forEach(t -> {
            t.setIsEnabled(false);
            if (sagaTaskMapper.updateByPrimaryKeySelective(t) != 1) {
                LOGGER.error("update saga task disabled error: {}", t);
            } else {
                LOGGER.info("update saga task disabled: {}", t);
            }
        });
    }

    private SagaTaskDTO findByCode(final List<SagaTaskDTO> sagaTaskList, final String sagaCode, final String code) {
        for (SagaTaskDTO sagaTask : sagaTaskList) {
            if (StringUtils.isEmpty(sagaTask.getCode()) || StringUtils.isEmpty(sagaTask.getService()) || sagaTask.getSeq() == null) {
                return null;
            }
            if (sagaTask.getCode().equals(code) && sagaTask.getSagaCode().equals(sagaCode)) {
                return sagaTask;
            }
        }
        return null;
    }

}
