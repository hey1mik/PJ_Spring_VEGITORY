package com.vegitory.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	@Scheduled(cron = "0 53 9 * * *")
	public void cronTest() {
		log.info(" Welcome Scheduling :-) ");
	}
}
