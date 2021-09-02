package com.jsoftware.batch.biz.S003;

import com.jsoftware.batch.common.util.CommonBatchTask;
import org.springframework.batch.core.*;

public class S003JobListener extends CommonBatchTask implements JobExecutionListener {

    @Override
    public void beforeJob(JobExecution jobExecution) {
        startTime();
    }

    @Override
    public void afterJob(JobExecution jobExecution) {
        finishTime();
    }
}
