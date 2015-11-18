package controller;

import bean.AjaxResponseBody;
import bean.Capacitacion;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.CapacitacionService;

@RestController
public class AjaxController {

    @Autowired
    CapacitacionService capacitacionService;

    @RequestMapping(value="/api/capacitacion/create")
    public String getSearchResultViaAjax(@RequestBody Capacitacion capacitacion) {

        AjaxResponseBody result = new AjaxResponseBody();

//        if (isValidSearchCriteria(search)) {
//            capacitacionService.insertarCapacitacion(capacitacion);
//            if (capacitacion.getId() != 0) {
                result.setMessage("");
                result.setCode("200");
                result.setResult(capacitacion);
//            }
//            if (users.size() > 0) {
//                result.setCode("200");
//                result.setMessage("");
//                result.setResult(users);
//            }
            //TODO 204

//        } else {
//            result.setCode("400");
//        }
        return getJson(result);
    }


    private String getJson(Object object) {
        return new Gson().toJson(object);
    }
}
