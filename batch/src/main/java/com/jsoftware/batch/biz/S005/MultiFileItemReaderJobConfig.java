package com.jsoftware.batch.biz.S005;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.MultiResourceItemReader;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternUtils;

@Slf4j
@Configuration
@AllArgsConstructor
public class MultiFileItemReaderJobConfig {

    @Data
    @AllArgsConstructor
    public static class ItemVo {
        String item;
    }

    private final ResourceLoader resourceLoader;
    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    private static final int chunkSize = 2;

    @Bean
    public Job multiTxtFileItemReaderJob() {
        return jobBuilderFactory.get("multiTxtFileItemReaderJob")
                .start(multiTxtFileItemReaderStep())
                .build();
    }

    @Bean
    public Step multiTxtFileItemReaderStep() {
        return stepBuilderFactory.get("multiTxtFileItemReaderStep")
                .<ItemVo, ItemVo>chunk(chunkSize)
                .reader(multiResourceItemReader())
                .writer(itemVo -> itemVo.stream()
                        .map(ItemVo::toString)
                        .forEach(log::info))
                .build();
    }

    @Bean
    @SneakyThrows
    public MultiResourceItemReader<ItemVo> multiResourceItemReader(){
        MultiResourceItemReader<ItemVo> resourceItemReader = new MultiResourceItemReader<ItemVo>();
        resourceItemReader.setResources(ResourcePatternUtils.getResourcePatternResolver(this.resourceLoader).getResources("read_sample/*.txt"));
        resourceItemReader.setDelegate(multiFileItemReader());
        return resourceItemReader;
    }


    @Bean
    public FlatFileItemReader<ItemVo> multiFileItemReader() {
        FlatFileItemReader<ItemVo> flatFileItemReader = new FlatFileItemReader<>();
        flatFileItemReader.setLineMapper((line, lineNumber) -> new ItemVo(line));
        return flatFileItemReader;
    }


}
