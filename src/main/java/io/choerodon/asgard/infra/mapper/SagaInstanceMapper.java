package io.choerodon.asgard.infra.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import io.choerodon.asgard.api.vo.SagaInstanceDetails;
import io.choerodon.asgard.api.vo.SagaInstanceFailureVO;
import io.choerodon.asgard.infra.dto.SagaInstanceDTO;
import io.choerodon.mybatis.common.BaseMapper;

public interface SagaInstanceMapper extends BaseMapper<SagaInstanceDTO> {

    List<SagaInstanceDetails> fulltextSearchInstance(@Param("sagaCode") String sagaCode,
                                                     @Param("status") String status,
                                                     @Param("refType") String refType,
                                                     @Param("refId") String refId,
                                                     @Param("params") String params,
                                                     @Param("level") String level,
                                                     @Param("sourceId") Long sourceId,
                                                     @Param("id") Long id,
                                                     @Param("offSet") Long offSet,
                                                     @Param("size") Integer size,
                                                     @Param("searchId") String searchId);

    Map<String, Integer> statisticsByStatus(@Param("level") String level,
                                            @Param("sourceId") Long sourceId);

    List<SagaInstanceFailureVO> statisticsFailure(@Param("level") String level,
                                                  @Param("sourceId") Long sourceId,
                                                  @Param("startTime") String startTime,
                                                  @Param("endTime") String endTime);

    List<SagaInstanceDTO> statisticsFailureList(@Param("level") String level,
                                                @Param("sourceId") Long sourceId,
                                                @Param("startTime") String startTime,
                                                @Param("endTime") String endTime);

    SagaInstanceDetails selectDetails(@Param("id") Long id);

    List<Map<String, Object>> selectFailedTimes(@Param("begin") String begin,
                                                @Param("end") String end);

    List<SagaInstanceDTO> selectUnConfirmedTimeOutInstance(@Param("timeOut") int unConfirmedTimeoutSeconds, @Param("now") Date now);

    List<Long> selectCompletedIdByDate(@Param("fromNowSeconds") long fromNowSeconds, @Param("now") Date now);

    int deleteBatchByIds(@Param("ids") List<Long> ids);

    int deleteByOptions(@Param("time") Date time, @Param("retainFailed") boolean retainFailed);

    List<SagaInstanceDetails> queryByRefTypeAndRefIds(@Param("refType") String refType, @Param("refIds") List<String> refIds, @Param("sagaCode") String sagaCode);

    long selectTotalElements(@Param("sagaCode") String sagaCode,
                             @Param("status") String status,
                             @Param("refType") String refType,
                             @Param("refId") String refId,
                             @Param("params") String params,
                             @Param("level") String level,
                             @Param("sourceId") Long sourceId,
                             @Param("id") Long id,
                             @Param("searchId") String searchId);


}
