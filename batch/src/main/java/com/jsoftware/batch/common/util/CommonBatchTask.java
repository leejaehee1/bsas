package com.jsoftware.batch.common.util;

import com.jsoftware.batch.common.vo.DataItem;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
public abstract class CommonBatchTask {
    public long startTime() {
        long startTimeStamp = System.currentTimeMillis();
        log.info("Start time : {}", startTimeStamp);
        return startTimeStamp;
    }

    public long finishTime() {
        long finishTimeStamp = System.currentTimeMillis();
        log.info("Start time : {}", finishTimeStamp);
        return finishTimeStamp;
    }

    public long elapsedTime(long startTimeStamp, long finishTimeStamp) {
        log.info("Start time : {}", startTimeStamp);
        log.info("Start time : {}", finishTimeStamp);
        log.info("Elapsed time : {}", finishTimeStamp - startTimeStamp);
        return finishTimeStamp - startTimeStamp;
    }

    public void executeTask(final StepContribution stepContribution, final ChunkContext chunkContext) {
        log.info("Batch service start!");
        try {
            DataItem param = new DataItem();
            DataItem meta = new DataItem();

            log.info(param.toJson());
            log.info(meta.toJson());
        } catch (Exception e) {
            log.info(e.getCause().getMessage());
        } finally {
            log.info("Batch service finish!");
        }
    }


    @Transactional
    public void executeTransactionalTask(final StepContribution stepContribution, final ChunkContext chunkContext) {
        log.info("Transactional batch service start!");
        try {
            DataItem param = new DataItem();
            DataItem meta = new DataItem();

            log.info(param.toJson());
            log.info(meta.toJson());
        } catch (Exception e) {
            log.info(e.getCause().getMessage());
        } finally {
            log.info("Transactional batch service finish!");
        }
    }
}
