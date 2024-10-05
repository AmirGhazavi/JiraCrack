#Remove the old JAR file if it exists
RUN rm -f /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.4.6.jar

#Copy the new JAR file into the Jira directory
COPY ./atlassian-extras-3.4.6.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib

#Make the JAR file executable
RUN chmod +x /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.4.6.jar

#Change directory to where the JAR file is located
WORKDIR /opt/atlassian/jira/atlassian-jira/WEB-INF/lib

#Run the start and stop scripts sequentially without sourcing
RUN /opt/atlassian/jira/bin/start-jira.sh && \
/opt/atlassian/jira/bin/stop-jira.sh && \
/opt/atlassian/jira/bin/start-jira.sh

#Expose port 8080
EXPOSE 8080

#Start Jira in the foreground
CMD ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]
===