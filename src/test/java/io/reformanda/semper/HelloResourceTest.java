package io.reformanda.semper;

import org.junit.Test;

import javax.ws.rs.core.Response;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.IsEqual.equalTo;

public class HelloResourceTest {

    @Test
    public void shouldSayHelloAnonWhenNoNameParameterSupplied() {
        final Response response = new HelloResource().getHello(null);
        assertThat(response.getEntity(), equalTo("Hello there Anonymous!"));
    }

    @Test
    public void should200WhenNoNameParameterSupplied() {
        final Response response = new HelloResource().getHello(null);
        assertThat(response.getStatus(), equalTo(200));
    }

    @Test
    public void shouldSayHelloWhenNameParameterSupplied() {
        final Response response = new HelloResource().getHello("bob");
        assertThat(response.getEntity(), equalTo("Hello there bob!"));
    }

    @Test
    public void should200WhenNameParameterSupplied() {
        final Response response = new HelloResource().getHello("bob");
        assertThat(response.getStatus(), equalTo(200));
    }
}
