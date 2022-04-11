package tw.grp4.config;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "tw.grp4")
@EnableTransactionManagement
public class RootAppConfig {

    @Bean
    public DataSource dataSource() throws NamingException {
        JndiObjectFactoryBean jndiObjectFactoryBean = new JndiObjectFactoryBean();
        jndiObjectFactoryBean.setJndiName("java:comp/env/SqlServerJdbc/HouseShipDB");
        jndiObjectFactoryBean.afterPropertiesSet();
        return (DataSource) jndiObjectFactoryBean.getObject();
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() throws NamingException {
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();

        Properties properties = new Properties();
        properties.put("hibernate.dialect", org.hibernate.dialect.SQLServerDialect.class);
        properties.put("hibernate.show_sql", Boolean.TRUE);
        properties.put("hibernate.format_sql", Boolean.TRUE);
//        properties.put("hibernate.current_session_context_class", "thread");

        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setPackagesToScan("tw.grp4");
        sessionFactoryBean.setHibernateProperties(properties);

        return sessionFactoryBean;
    }

    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
        return new HibernateTransactionManager(sessionFactory);
    }

//    @Bean
//    public MappingJackson2JsonView jsonView() {
//        MappingJackson2JsonView jackson2JsonView = new MappingJackson2JsonView();
//        jackson2JsonView.setPrettyPrint(true);
//        return jackson2JsonView;
//    }
//
//    @Bean
//    public Jaxb2Marshaller jaxb2Marshaller() {
//        Jaxb2Marshaller jaxb2Marshaller = new Jaxb2Marshaller();
//        jaxb2Marshaller.setPackagesToScan("tw.grp4");
//        return jaxb2Marshaller;
//    }
//
//    @Bean
//    public ContentNegotiatingViewResolver contentNegotiatingViewResolver() {
//        ContentNegotiatingViewResolver contentNegotiatingViewResolver = new ContentNegotiatingViewResolver();
//        List<View> defaultViews = new ArrayList<>();
//        defaultViews.add(jsonView());
//        contentNegotiatingViewResolver.setDefaultViews(defaultViews);
//        return contentNegotiatingViewResolver;
//    }

}
