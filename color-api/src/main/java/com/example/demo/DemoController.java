package com.example.demo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    private String color = String.format("#%06x", (int)(Math.random()*16777215));
    private final RequestsRepository requestsRepository;

    public DemoController(RequestsRepository requestsRepository) {
        this.requestsRepository = requestsRepository;
    }

	@GetMapping("/color")
	public Map<String, String> index() {
		Map<String, String> response = new HashMap<String, String>();
        // generate a random hex color
        response.put("hex", this.color);
        // save the request to the database
        Requests request = new Requests();
        request.date = new Date();
        requestsRepository.save(request);

        return response;
	}
}
