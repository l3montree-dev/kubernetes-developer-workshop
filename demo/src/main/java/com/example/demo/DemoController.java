package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    private String color = String.format("#%06x", (int)(Math.random()*16777215));

	@GetMapping("/color")
	public Map<String, String> index() {
		Map<String, String> response = new HashMap<String, String>();
        // generate a random hex color
        response.put("hex", this.color);

        return response;
	}
}
