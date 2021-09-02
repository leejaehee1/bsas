package com.jsoftware.batch.biz.S003;

import com.jsoftware.batch.common.util.CommonBatchTask;
import org.springframework.batch.core.ExitStatus;
import org.springframework.batch.core.StepExecution;
import org.springframework.batch.core.StepExecutionListener;

public class S003StepListener extends CommonBatchTask implements StepExecutionListener {
    @Override
    public void beforeStep(StepExecution stepExecution) {
        startTime();
    }

    @Override
    public ExitStatus afterStep(StepExecution stepExecution) {
        finishTime();
        return ExitStatus.COMPLETED;
    }
}
