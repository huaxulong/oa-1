package org.joa.swft;

import org.joa.swft.manager.netty.NettyServer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.Async;

/**
 * @author jtj
 */
@SpringBootApplication
@MapperScan("org.joa.swft.dao")
public class SwftApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(SwftApplication.class, args);

    }

    @Async
    @Override
    public void run(String... args) throws Exception {
        new NettyServer(12345).start();
    }

}
