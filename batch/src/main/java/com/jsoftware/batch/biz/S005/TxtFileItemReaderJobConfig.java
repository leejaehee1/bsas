package com.jsoftware.batch.biz.S005;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Slf4j
@Configuration
@AllArgsConstructor
public class TxtFileItemReaderJobConfig {

    @Data
    @AllArgsConstructor
    public static class ItemVo {
        String item;
    }

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    private static final int chunkSize = 2;

    @Bean
    public Job TxtFileItemReaderJob() {
        return jobBuilderFactory.get("txtFileItemReaderJob")
                .start(txtFileItemReaderStep())
                .build();
    }

    @Bean
    public Step txtFileItemReaderStep() {
        return stepBuilderFactory.get("txtFileItemReaderStep")
                .<ItemVo, ItemVo>chunk(chunkSize)
                .reader(txtFileItemReader())
                .writer(itemVo -> itemVo.stream()
                        .map(ItemVo::toString)
                        .forEach(log::info))
                .build();
    }

    @Bean
    public FlatFileItemReader<ItemVo> txtFileItemReader() {
        FlatFileItemReader<ItemVo> flatFileItemReader = new FlatFileItemReader<>();
        flatFileItemReader.setResource(new ClassPathResource("read_sample/sample.txt"));
        flatFileItemReader.setLineMapper((line, lineNumber) -> new ItemVo(line));
        return flatFileItemReader;
    }

}