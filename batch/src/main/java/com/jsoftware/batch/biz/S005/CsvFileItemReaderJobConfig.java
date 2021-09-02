package com.jsoftware.batch.biz.S005;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.batch.item.file.mapping.DefaultLineMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Slf4j
@Configuration
@AllArgsConstructor
public class CsvFileItemReaderJobConfig {

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CsvItemVo {

        int number;
        String item;
    }

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    private static final int chunkSize = 2;

    @Bean
    public Job csvFileItemReaderJob() {
        return jobBuilderFactory.get("csvFileItemReaderJob")
                .start(csvFileItemReaderStep())
                .build();
    }

    @Bean
    public Step csvFileItemReaderStep() {
        return stepBuilderFactory.get("csvFileItemReaderStep")
                .<CsvItemVo, CsvItemVo>chunk(chunkSize)
                .reader(csvFileItemReader())
                .writer(csvItemVo -> csvItemVo
                        .stream()
                        .map(CsvItemVo::toString)
                        .forEach(log::info))
                .build();
    }

    @Bean
    public FlatFileItemReader<CsvItemVo> csvFileItemReader() {
        FlatFileItemReader<CsvItemVo> flatFileItemReader = new FlatFileItemReader<>();
        flatFileItemReader.setResource(new ClassPathResource("/read_sample/sample_data.csv"));
        flatFileItemReader.setLinesToSkip(1);

        DefaultLineMapper<CsvItemVo> defaultLineMapper = new DefaultLineMapper<>();

        DelimitedLineTokenizer delimitedLineTokenizer = new DelimitedLineTokenizer();
        delimitedLineTokenizer.setNames("number","item");

        BeanWrapperFieldSetMapper<CsvItemVo> beanWrapperFieldSetMapper = new BeanWrapperFieldSetMapper<>();
        beanWrapperFieldSetMapper.setTargetType(CsvItemVo.class);

        defaultLineMapper.setLineTokenizer(delimitedLineTokenizer);
        defaultLineMapper.setFieldSetMapper(beanWrapperFieldSetMapper);

        /*
        flatFileItemReader.setLineMapper(new DefaultLineMapper<>() {
            {
                setLineTokenizer(new DelimitedLineTokenizer() {
                    {
                        setNames("number", "item");
                    }
                });
                setFieldSetMapper(new BeanWrapperFieldSetMapper<>(){
                    {
                        setTargetType(CsvItemVo.class);
                    }
                });
            }
        });
         */
        flatFileItemReader.setLineMapper(defaultLineMapper);
        return flatFileItemReader;
    }


}