package com.example.demo;


import java.util.Date;

import jakarta.persistence.*;

@Entity
public class Requests {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    Date date;
}
