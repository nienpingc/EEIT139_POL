package tw.grp4.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import tw.grp4.Handler.permissionCheckedHandler;
import tw.grp4.util.StringToTimeConverter;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "tw.grp4")
public class WebAppConfig implements WebMvcConfigurer {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
    
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new StringToTimeConverter());
    }
    //之後路徑要想辦法把member去掉,應該跟{mid}有關
    @Bean
    public InternalResourceViewResolver viewResolver() {
        return new InternalResourceViewResolver("/WEB-INF/resources/JSP/", ".jsp");
    }
    //user要想訪問"/"的請求都導到方法"home"
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addRedirectViewController("/", "home");
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration registration = registry.addInterceptor(new permissionCheckedHandler());
        registration.addPathPatterns("/**"); 
        registration.excludePathPatterns(    
                "/returntosigninpage.controller", 
                "/home",
                "/**/*.html",                
                "/**/*.js",                  
                "/**/*.css"                  
        );
    }
//有這個才讀得到靜態資源
//之所以index.jsp裡JS和CSS的路徑最前面都沒有/,是因為當時待轉的頁面是http://localhost:8080/HouseShip/home

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { 
        registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
        registry.addResourceHandler("/CSS/**").addResourceLocations("/WEB-INF/resources/CSS/");
        registry.addResourceHandler("/JS/**").addResourceLocations("/WEB-INF/resources/JS/");
    }
}