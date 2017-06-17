package org.nagyadam2092.tripchecker.controller;

import org.nagyadam2092.tripchecker.database.TripNamesRepository;
import org.nagyadam2092.tripchecker.database.TripNames;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TripNamesController {

    @Autowired
    private TripNamesRepository tripNamesRepository;

    @GetMapping(path = "/tripnames")
    public @ResponseBody Iterable<TripNames> getAllTripNames() {
        return tripNamesRepository.findAll();
    }

}
