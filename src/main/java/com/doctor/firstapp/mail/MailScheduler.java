package com.doctor.firstapp.mail;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class MailScheduler
{
	public void mail()
	{
		try {
			JobDetail job1 = JobBuilder.newJob(mailjob.class)
					.withIdentity("mailjob", "group1").build();

			Trigger trigger1 = TriggerBuilder.newTrigger()
					.withIdentity("cronTrigger1", "group1")
					.withSchedule(CronScheduleBuilder.cronSchedule("0 50 19 * * ?"))
					.build();
			
			Scheduler scheduler1 = new StdSchedulerFactory().getScheduler();
			scheduler1.start();
			scheduler1.scheduleJob(job1, trigger1);
			Thread.sleep(100000);
			
			scheduler1.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			JobDetail job2 = JobBuilder.newJob(morningmail.class)
					.withIdentity("morningmail", "group1").build();

			Trigger trigger2 = TriggerBuilder.newTrigger()
					.withIdentity("cronTrigger1", "group1")
					.withSchedule(CronScheduleBuilder.cronSchedule("0 00 09 * * ?"))
					.build();
			
			Scheduler scheduler2 = new StdSchedulerFactory().getScheduler();
			scheduler2.start();
			scheduler2.scheduleJob(job2, trigger2);
			Thread.sleep(100000);
			
			scheduler2.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			JobDetail job3 = JobBuilder.newJob(Afternoonmail.class)
					.withIdentity("Afternoonmail", "group1").build();

			Trigger trigger3 = TriggerBuilder.newTrigger()
					.withIdentity("cronTrigger1", "group1")
					.withSchedule(CronScheduleBuilder.cronSchedule("0 00 13 * * ?"))
					.build();
			
			Scheduler scheduler3 = new StdSchedulerFactory().getScheduler();
			scheduler3.start();
			scheduler3.scheduleJob(job3, trigger3);
			Thread.sleep(100000);
			
			scheduler3.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			JobDetail job4 = JobBuilder.newJob(Nightmail.class)
					.withIdentity("Nightmail", "group1").build();

			Trigger trigger4 = TriggerBuilder.newTrigger()
					.withIdentity("cronTrigger1", "group1")
					.withSchedule(CronScheduleBuilder.cronSchedule("0 0 20 * * ?"))
					.build();
			
			Scheduler scheduler4 = new StdSchedulerFactory().getScheduler();
			scheduler4.start();
			scheduler4.scheduleJob(job4, trigger4);
			Thread.sleep(100000);
			
			scheduler4.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}