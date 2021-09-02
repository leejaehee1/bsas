package com.jsoftware.batch.biz.S003;

import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.partition.support.Partitioner;
import org.springframework.batch.item.ExecutionContext;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class S003Partitioner implements Partitioner {
    @Override
    public Map<String, ExecutionContext> partition(int gridSize) {
        log.info("partition start!");

        int min = 10;
        int max = 100;
        int targetSize = (max - min) / gridSize + 1;

        Map<String, ExecutionContext> result = new HashMap<>();

        int number = 0;
        int start = min;
        int end = start + targetSize - 1;

        while (start <= max) {
            ExecutionContext executionContext = new ExecutionContext();
            result.put("partition" + number, executionContext);

            if (end >= max) {
                end = max;
            }

            executionContext.putInt("minValue", start);
            executionContext.putInt("maxValue", end);

            start += targetSize;
            end += targetSize;
            number++;
        }

        log.info("partition end!");

        return result;
    }
}
