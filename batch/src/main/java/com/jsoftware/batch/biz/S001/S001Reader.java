package com.jsoftware.batch.biz.S001;

import com.jsoftware.batch.common.vo.DataItem;
import org.mybatis.spring.batch.MyBatisCursorItemReader;
import org.springframework.batch.core.StepExecution;
import org.springframework.batch.core.annotation.BeforeStep;

public class S001Reader extends MyBatisCursorItemReader<DataItem> {

    @BeforeStep
    public void setParams(StepExecution stepExecution) {
        // java command input parameters
        String loginId = stepExecution.getJobParameters().getString("loginId");
        String param1 = stepExecution.getJobParameters().getString("param1");
        String param2 = stepExecution.getJobParameters().getString("param2");

        DataItem dataItem = new DataItem();
        dataItem.put("loginId", loginId);
        dataItem.put("param1", param1);
        dataItem.put("param2", param2);
        this.setParameterValues(dataItem);
    }
}
