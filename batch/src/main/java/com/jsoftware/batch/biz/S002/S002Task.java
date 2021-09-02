package com.jsoftware.batch.biz.S002;

import com.jsoftware.batch.common.util.CommonBatchTask;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;

public class S002Task extends CommonBatchTask {

    @Override
    public void executeTask(final StepContribution stepContribution, final ChunkContext chunkContext) {
        long startTime = startTime();
        System.out.println(startTime);
    }

    @Override
    public void executeTransactionalTask(final StepContribution stepContribution, final ChunkContext chunkContext) {
        long startTime = startTime();
        System.out.println(startTime);
    }
}
