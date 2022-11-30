# JAX-RS
この文書はJava API for RESTful Web Services (JAX-RS)についてまとめたものである。

## Application
Java EEアプリケーションサーバで動かすにはApplicationサブクラスを作る。

`ApplicationPath`で指定したPathがcontext rootになる。

    import javax.ws.rs.ApplicationPath;
    import javax.ws.rs.core.Application;
    
    @ApplicationPath("rest")
    public class ExApplication extends Application {
    }

## Resources

    @Path("/articles")
    public class Articles {
        @GET
        public String index() { ... }
        
        @GET
        @Path("/{id}")
        public show() { ... }
        
        @POST
        public create() { ... }
        
        @PUT
        @Path("/{id}")
        public update() { ... }
        
        @DELETE
        @Path("/{id}")
        public delete() { ... }
        ...
    }

## Parameter mapping
### @QueryParam

    GET /articles?name=value
    
    @GET
    public String index(@QueryParam("name") String name) {
        ...
    }

### @FormParam

    POST /articles
    <input type='text' name='name'>
    
    @POST
    public String create(@FormParam("name") String name) {
        ...
    }

### @PathParam

    GET /articles/3
    
    @POST
    @GET("/{id}")
    public String show(@PathParam("id") String id) {
        ...
    }

### @CookieParam

    @POST
    public String create(@Cookie("jsessionid") String jsessionId) {
        ...
    }

### @HeaderParam

    @GET
    public String index(@HeaderParam("Referer") String referer) {
        ...
    }

### @Context

    @GET
    public String index(@Context HttpServletRequest request) {
        ...
    }

### @Consumes, @Produces
`Consumes`でrequestで受け入れ可能なContent-Typewを、ProducesでresponseのContent-Typeを指定できる。

    @GET
    @Consumes("text/plain")
    @Produces("text/plain")
    public String helloJAXRS() {
        return "hello JAX-RS";
    }

## Filters
## Interceptors
