package com.jsoftware.batch.biz.S003;

import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.StepExecution;
import org.springframework.batch.core.job.flow.FlowExecutionStatus;
import org.springframework.batch.core.job.flow.JobExecutionDecider;

import java.util.Random;

@Slf4j
public class S003Decision implements JobExecutionDecider {
    @Override
    public FlowExecutionStatus decide(JobExecution jobExecution, StepExecution stepExecution) {
        Random random = new Random();
        int randomInt = random.nextInt();

        log.info("number : {}", randomInt);

        if (randomInt % 4 == 0) {
            return FlowExecutionStatus.FAILED;
        } else if (randomInt % 4 == 1) {
            return FlowExecutionStatus.STOPPED;
        } else if (randomInt % 4 == 2) {
            return FlowExecutionStatus.UNKNOWN;
        }

        return FlowExecutionStatus.COMPLETED;
    }
}
