package com.jsoftware.batch.biz.S002;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;

@Slf4j
@RequiredArgsConstructor
public class S002Tasklet implements Tasklet {

    private S002Task s002Task;

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        log.info("start execute");

        s002Task.executeTask(contribution, chunkContext);
        s002Task.executeTransactionalTask(contribution, chunkContext);

        return RepeatStatus.FINISHED;
    }
}
