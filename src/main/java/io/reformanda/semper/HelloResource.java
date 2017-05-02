package io.reformanda.semper;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import java.util.Optional;

@Path("hello")
public class HelloResource {

    @GET
    public Response getHello(@QueryParam("name") final String name) {
        return Response.ok("Hello there " + Optional.ofNullable(name).orElse("Anonymous") + "!").build();
    }
}
