package com.example.demo;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface RequestsRepository extends JpaRepository<Requests, Long> {
}
