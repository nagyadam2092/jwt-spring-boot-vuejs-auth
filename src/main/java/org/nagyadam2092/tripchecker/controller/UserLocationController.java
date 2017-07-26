package org.nagyadam2092.tripchecker.controller;

import org.nagyadam2092.tripchecker.database.UserLocation;
import org.nagyadam2092.tripchecker.database.UserLocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by anagy on 2017. 07. 13..
 */
@Controller
@RequestMapping("/api")
public class UserLocationController {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserLocationRepository userLocationRepository;

    @CrossOrigin
    @GetMapping(path = "/userlocation")
    public @ResponseBody
    Iterable<UserLocation> getAllUserLocations() {
        return userLocationRepository.findAll();
    }

//    @CrossOrigin
//    @GetMapping(path = "/userlastlocation")
//    public ResponseBody
//    UserLocation getLastUserLocation() {
//        return userLocationRepository.
//    }

    @CrossOrigin
    @PostMapping(path = "/userlocation")
    public ResponseEntity<Boolean> saveUserLocation(@RequestBody UserLocation userLocation) {
        log.info("user location changed: " + userLocation.getUsername(), ", lat: "
                + userLocation.getLat() + ", lng: " + userLocation.getLng());
        userLocationRepository.save(userLocation);
        return null;
    }
}
