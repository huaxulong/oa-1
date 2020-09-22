-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: swft
-- ------------------------------------------------------
-- Server version	5.5.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'processes/MyProcess.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"申请请假\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"请假天数\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"请假类型\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"请假人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"请假人ID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"部门审核\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人ID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"总经理审核\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人id\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2502',1,'processes/MyProcess.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"申请请假\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"请假天数\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"请假类型\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"请假人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"请假人ID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"部门审核\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人ID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"总经理审核\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人id\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2503',1,'processes/MyProcess.myProcess.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0�\0\0\0\Z�<\0\06IDATx^��\r�\\u}/�`mM{�b��Z��T[��V����K��VS$�6���$�*��*�DP�J}A*pQ�\n����@D�HIQ#(�@Hx���gg�������잝��<������������|sfΙ7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`��j�1��|�\0\0�`2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S����_{�_�f�]�V�\Z;�s�\09��s����9���۬��\0�#�)��W_��.�`lӦMcw�y��]w�%H�i�D��#��.�v+�\0��d\n��z��;�N|�s/��ƍo�r�:�nec>\0��La��[�*nҶ�r�5�nec>\0��La���{�z)V�6ʷ[٘\0�G&S�N���n��ғǮ<���INc�z��(W�\0����ru�-7��;�б��8�IciY���7ʕ�\0\0zf2���\\]w��&�f����֗�F�2\0@�L�0x�����?jB�j&-�ח�F�����|��|\0�!�\n��r�JU3iY���7%/W�Pm��۸U�\0`:�+<��)q�j�f�ʿ\0:�\\��uR����R�LZ��/�MI��dEj�q\0`G�+�N�Ն���P��I�����)a���@M�\0�)W0x����o��غo6�X���,__�����N�S��\0�r��I�J���L(Wi,_O����nS��@y)W0x��m��6|�	�*��e֗��$�j�Ei���rQ�`�*W��r����?6�X5���u��I�R�r�kA���\00��+�I�նmc�7�7v�YO(Ty�:i]G��!/W�*F�z\0N�^�r5�Ѫ��(�`2��߅�ߏ\0�C���kW�:9Z5Y�}�Ǔ�2��*/B;Evo�v#�_��\0@�\\��+Wya�6��Io�r��T�N���g��`Mv���\0�\n�]��be��U�Ⓨ<��c3���b�̲���\0��r��\\?CT�&+<�Ҏ\nV��Ol�����@�(W0}��sr�RyJ>�S���\"����:?� ��TE�]ajW�ڭ׮X5M�}��+������^��622�|y�rU��\\����nJV��]qj-X��X5u��`x)W0}-;��S�V�Үd)W�OA�U�%��bӮ@���f��b����\0��\\����	���y^s=��)x��Qɚn�iW��ξ�X5M��\0�ܧ\\�����ͳ}gX�*~�H�z��ռދL���K�j��y�ܔ&�|��r���X���.\\��]w���-Z��J��s��z���G-Y��1�������G��N�P�V�*��X�ב�Mos��]��јŋ� ~n^�v�b�?E^�^�����n�����E��qKblYd���b|E�y�}K��bl���\"��;\"��C#+#�G�ˎ��{�?b��#������\"\'DN�e��|:rj|����\"_�|9rF��o�}ϊuΉ?��\\�0rqdu����b�E~^�*ru�ȵ��G��M���s�rU���v�N���͟??�~���w)�0?b��N�H�+���\0Zi��ǘ�\Z;`�E�l�l�2q[��\Z�9��ȯ\"��\\W/�4l�������K��T2���Kj��㻵�2r~m��|;���7\"_����/��K���sJ��|2��Dm�}�6^�>�(KGG�j�����K�a��up�t9�Q�������\"+\"��e{T�K�h}���x�{uu���2�0��(�/���������c��\"yv*�Q<�Q/�O����\'7Jh*������m$���r��N%���j��#�3Sˋ�9r�*��-hY��#D;:r��,����y�ܔ&�|���v���ou�h�n�zE/W;\Z����*/U��[d���V�k����M��\0��g\'|8ٮ3�e���v��I��|yQR�r��RժۂծX��X�;[`�+�׾���G����\'�����[�+�����P�>�lי��br����|Y+�j��EI��U���U�k�b���\\uR���(X/i|>3}����Ȗ�b���}yCz�m�<h�\0\00��	N��̘�T5)W�//J�T�z0U�jW�Z�US��vT�v�}+��6>���xm�Tm��wD.��������oc����\0s����d��r5��dH�U2Y�iW����v�+X�}�Z�t�Kg�b�o�^�R?#g*\\ߋ�c��t2�tB���\0PXv��Z,���ˋ�!*WI�³��΋US����ey��3m�J�Q��1���񳌦3���(��G\"Kҙ;.\0\n�N�p�]����]fjyQ2d�*ɋOkQ�X5Mv���\"]�/\n�K�pX��C����d}\'������_����\0�c\'|8ٮ�R�r%��r��(�t��\"��/�e��u��u�����m��\Z=������:��\0�N�p�]�E�*~��\\%�.B�~��X�lٟT���׾�#_��\"��(Z���/L�������\0���\'۵X���g��UүBԯǙK�.��(\\�����W#7D~cgE�zo��Ց���\0��N�p�]�E�*~��\\%��^�_�J��Q�^��+#gF6Gn��o���E�?��\0�>�l�bQ�����d�i����p=6��n�yD䛑�\"��|=rXd�z����~\00����d��rU���\\%��n�\nQ���5�Z���ّ�D���9$��+b�?��@��	N�k�(W�O��U�ia�t�R�2��xm}]��s#���<�([,�yD~?\0�TL\0秝�)r~~?枴-�1f�rU���\\%S���������\Z�`c��5rm��G�?��������!/�ڔ�<��1��m��1{��⧄�*��@M6��v���W�\Z<�P��(Y��톸=-n�O�gGGG�{~G\0�ڎ�^9j5$��bQ������$/R���h�ʕ����x]^\Z�h仑ۣl�4n�_d�ȋ*��C��Pp��Z���ܔ�g>��Q������Y��m�*VE���p�M�V/�|,�:rG�\'��D�-��]w�����P0��G��\Z\"�U�(W�O��U��,[�`���p=3^���|<��Ȗ���#o�<w������0�j�^-��c�R��E�*~����̊+~?^��W䍑\"�5\n��#{E!���>$�/\03����W�Z\r�X���G�b��T*���IŪQ�R�J�+�T�VD�zv*f�}���^-ȗ3�)WŢ\\?�sYz�`��?�6�����\\��Q��[���>��0��0�/\0}Rk��Ǚ�l�bY�j��w�y�z)F�l�rY����v��,�#��G��^�:rem��k\"�F���j��k��`\Zj��W�8s��Z,]t�\r�6m��S/���_��(W����&��=�E��/rj�t�G.���&~i:m|:}|~_:�8����o���V��(n�����s:��o����E�)����_{�_�f�]�V���V�������Ŝ{��]x�לw�y��mVF�U����x��uÆ\r?w�8�mq��u�Ύא͑]��e�hѢ��N��#ok\\�8]�8]�������G��=5V�)�/�nO��/4\nk~�eC������?&�����C\\p�X�_h;I�I�i��N�v���\"J?��Ց��Ȭ%m��MJ����є�����A��ǜrm�w��|0�@-\n�S�)\\ۥϲ�r\Z�6[��nsr<�#��Ck���wx{Oq�q��[��R���&�@�c\00]Q�;�/��3�/E~%떸=7n���*�\'��v��U�\"�(IQP�;찱�O>9�����~���{�w��o���k׎}�s�;����r���x����C)����&m�����v+�\n�AKGX\"��9�������n�|;��{M������:��÷��n�r�-c\'�xb^�R�O�-��0T�[I�z)V�6ʷ[�(W\0̆(��9h�(V�|-����M�oE���ݢp=6��\\�(V��t�����{SW֯_?v���kk|�����F���[7�]{��cW�{���?��|=��+�\n��9�ϣ �\ZyO��o��7F~93�2�^�dɒ���+�����馛�4-魃_��Wǖ.]�Z�&)ê�ru�-7��;�б��8�IciY���7ʕr@����>.Jʫ\"�ruV�[����j�Б�����g��f[�3V��V�3�<3�G}����Z�n���ɟ�y�����ڄb���W~}����(W�\0sO�\'���E�l��.}~��/G�xW,��e��$�_���?�������k-\'�HG�)}v+;�uUz��9��ru��GM(Uͤe����(W�^�(W������/�h-��{�m�\Zg(��_��c���/�u�8�_��q���x�5N/?�ַ��X�뭀;�>��R�Rޞ?/��:)W��Y9�T5����KS�r�\n��Ⱦ�[�a�S�����S�Btt��j�����\\���%Q�v���N�g�fqi��׽�����+�q��G�W�J�1�n�Ο�,R<������u�!�r����e����wttt,���#���G>�ӎ=��7�\\�҅�Z(W�O��U�X5U�5\0��R���1\Z�p���\"�G�G>cD���E�=,�cz�a������w1vJs�����������7?���>7fQ*J�y�{.y��_�T7��+ƾ��/�����o�}����w���+V<9̲�\\��楪��,__�����Ɋ�d�\00�b��A�J�FyZ9&\n��\"wD�JE)���B�������r���������W4�u{�~��KZ�ۆֿ+��裏�g���+��_���6ۡ-[�l?J��{:蠏�m�L:)W.>vB�j&-�ח����j�5�r\0zQ�~ott�Q����g��K���6Ū�M�礓]4����ِ�^�>����g�?fH:Zu�!�|����?]���V������7m�}��_��2�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]\0J!��M��sw�����]_�e���k}^�\Z8�����i���vꩧ��}���6��K/�tlŊw��^�E�x�}�Y\'�*e�>3�\\��|=�JT��-Lݮ\0C�Z��֦LmO,�-n/�����[����`��c�i}�_��>X*Vo}�[���h�d�n�:v�I\'ݽdɒ�e*X��m��6|�	�*��e֗��$�j�Ei����������{\"�\\D���������y\nf�7����r�������#V�*V��:����n����FS���o�al���P��I��:���)A�� �z\0��\Zg�Xd�]D8��Q�����,�6n��Z��˟\'�>c��\n8��.��sϛ���i��F���m��6o8o슳�P��uҺ�b\r&C^��U���8\00�\ZG����~~̦[�{���a��)�tV�t����ׯ�7�ս����gش+WS��,�b\r&C\\��]���x\00t�Q�\"�J\'�s�j�5�x�L�0w����a{`�r��Ѫɒ�?���!-Wy�)�{����������o��w���Ϙ��R�|�j&q���YL��8��k�E���5Lڕ��0u���a��P*F\'E��3�vZ�&�_��\0P\n��D6���W��,һ�Z/����4Kͧ?��|xƴ^H8=���Ȁ��~w�C��%6��R�ϟ�0iW��X�rծ��#O���L\'��X5��ey��\0C���3>�mw-������?<���1\'�pB���`�w��V�\\��w����b&5�]�T��?�a�\\?CT�&+<�Ҏ\nV��Ol������P���/lS�&͞{���Θ�������H�;���g��_����0����7ޜZ~���.~PϏ,��s�U�S�r���US�v��]�j�^�b�4������g���y�jI*4ߎ���馛��߁��O�����b&s�1��]�6�3����\r�9x����+W�O��UG?W�NN���Z��-�Q�j������p�T����׭�#��i���]�x����@��\Z|�����c�߃x���w�l���K_��/js�&m~���+W�OA���Zt[l�����ڌwR���}\00\'D�zz:[��ߌ�.���6����sZ�[��<3wzgZ���g�?~S(�����<�ES���X���+��R��V�������?W\r�-4�\n��������>\0(����?�rT�|\"��t�g��T�6��=���l��*�=-��S�x��ۏ(\rZ:p2::�����)�~&6�T���i��ϯ�_�vپ3�\\?s�\\=��j^�E�]��X5���\0`F��Q-^��Q��s���\"g���T*����\'�|Cc^�4�yt�<ɏ^}��_�w��*���e�������e���\0��^��m�7�x��l�q��\\?�6+z�rl�����z���V���U�:��\"=�T����\0�]1�>1�ӛ��K������#�d�$��?�����ǥ�Uź͗�j���ҥKzr�SO=����?(�-p6�\Zݴf͚/Ԇ�3W͜_�#o�7������d��z��ռޏ���U��v���\0}�JP��]c.�Xd}m�3R��b5\Z�������>ǔ�x�������s]s>OG��}p#�J�*{;�q�sa����w�z6�\Z�t�)�||.^5�����^�v46��EI��U۟����v�*?�5��5��\0��S�_>;��;�\\\Z����1v`�iy~�A��_��ܞ�`�}���.񴤢��V��t����G�u�Q��U����w�O��a��+�w~��,/J\nZ�v�sբ�BӮX��X�;[`7���\0}�dɒ�D��=����)���#Q�����?��y���R�R�>���n�-�5�H:oB:+`v�j{��ꭊ�G?���y�膭�Cp���ȳ��Wt���*W�//J\nV�:���tZl&+V��ny\'���\0}��9�x��Ƽ��H��ͱ_���}}���϶4�ײ���o����I�l�2v�W�ױj�8G�f���������m޼9�n3f���W���\r�j��EI��U�*8�Sk�jj�ގ\n�T�\0��R����w�?��[��[�V���]�re�\'d\Z�t@!��Uy1z��p�	\'�0v�%�l�&V�\\R�,�ƍ�����c�����f�	9��� ��w�;��3��3c=�����[��\\M��(�r�LVt��vŪ����\n�d�\0�\"��#�8,��œj�\'��e���}u,�9_.HG�����q��	e����~���$Z�ߥ�W�q1��}�{�U�[����r5��d��UҮ��>��b�Ԯ`-kY���\0@OR�h�\0��%�[c�k������e��\\�JQ��ټfV�I%3����I��o<�裏�?/?�t�m��3::�a�->æ��]fjyQ2d�*ɋOkQ�X5Mv���`ڢ4�E����٣Gs.��?�_�bŊ���F������E��,R�ӿM�~0���Lژ��.��Ҽ\r�A�>t�!}�+>æ��J�3��*�P*F��S�Ū)�_��\0ЕE�=,�Ea�ϴ?�e�S��J����0猎��gŊwmݺ5�A}w��g�_����o��1����gH�U��\"����҉&b��9�����w҉(�)��������ׇ���{\\x�I\'ݝ��~��������6~�vɿ��R���!.WI�\nQ���}�?�,�uZ��:n��?���T*��C\'~��dɒ�Gu�o�9��-�JŪZ���a�\\?C^��^�Q��`ȥ�z�>޿D��uE�7��E�}\\�>�B:s_�|w�=��y����]�l\n����X�����U�rU���\\%�-Hӽ\0C�^��u��\"g5�9uQ䐑���ל����!�{�������I�[Og�_�\re��UN�*~JR��n�R��0Ė-[�\'�?W�}�Oƾ��������W�����Z��L��r����a�ڵWEW��l�-�?��7����,�N3�me8+�d���D�*�0u�\0C�q��ž�{����[#_����\ZK0\r�����Q�2]��>��z�)�||͚5_�����}��[ׯ_�g���#�<���������9���wB�*~JV�����T�R����T�b?�F��4�ŋ�cY�93\"�E�½��㋛����߷̔�⧄�*��@M6�Jo�}��b��k\"7DNn�����\0�J�*~JZ���H�_0d҉&�8�}�C\"6NDqv�GY?�!�U�S�r�4U�D�b0�*��c�8�%����)��E�����2.�������*yaz�o��\00���􎌌�<^�?��Tm�\"������V�>���\\?�������ߠH���|��~~͚5w�Z�j�Ϩ�~�=���.���k�;�E�6��6::���־x=�v�~6>+�ל�F���y)V�6ʷ[�(W�r��W�.۴i�؝w�9�gVf\'i[�m��x��%�n0���&\"�x��Tm�$�D���tr�E�=,_`((Wŏr�\\��ի�H;��Ϫ#7n�%^7V��\r)�=�ԋ���}��k���q�����_���U�V�����-[�\\;I[��V6�U���z�(nҶ��LH�����D��Zm��S�B�GD^�.�0�.���tqs����@+WE�w��7���9�ǯ��6r}�^�d�V�-[�\'��\0��>��jժ[7l����?�۶m�06W���u�֝;H�}vB�*�N���n��ғǮ<���INc�z��(W�C:�����?�k��QT�ճ���ǟ�:_�y�w�vIGG��H҄<�O}j,���s8i[�mR�b�(WŒ~F��<��r�غ�[���4����K��Q�ݠ��������G>�M��G��2�2ל(��\0�F����U�tR����k�U3�_��	�K�\\m�t`�]w��(N����x��I��gcl�%K�<&_�!�h��N���i�r�>�X:)WW�ԄR�LZ��/��r�����db��ۘ;��s\Zל� r���������(�t6��64�U��|�>�X:)W��Y9�T5����KS�r�,V�6nK_�*�ʟ���H�O�����ȱ�������\0�T�Zݷ�X�l�����z�m�U�(W�O��U~�*��b��x�\\��ȸ��qͩ/G��eO���y˗/x��Z�U��u�۔�b�\\��楪��,__�����Ɋ�d�C%\n�_E�\Z��_��.�&r��ŋ_��S\0L)&������?t�x��3w)W��I��p�JU3iY���7%,WS����9�Je��^��\'D6E~9�^�/�e����I����$r{^�����m�}����b�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]��b���(Sϋ�;^/n���q�_�==_\0:V�:��RՒͮ�1<��b�\\�l��g&��4��\'�O��U�����gU��GyzC�~!rsdm|��/~���\0]k�JgLo���M�j��=�/s�rU,��m��6|�	�*��e֗��$�j�Ei���tͩ������#�wU�����ju��50cb�yUL>_i����)1��|=�&�X�*W��r����?6�X5���u��I�R�r�kA�����S�]ό��x�[�x���1��ȳ���\00p1	�bR:-g8(W�2i�ڶml��Ʈ8��	�*OZ\'��(�`2��_Ũ_�ӕ��Y�k���*ru�a�D^�t�����\03.&��5Z�U��+WS��,�b\r&C\\��]���x�kN-^��%�:��(P?���F�Y��e��\0�.&��\"����Xڕ�N�VM�t���i�ʋPz�\\�lm�o���?nϢP=5^��-rfm��S�#+#�Og����Bi�����8�A�*�v�*/L�&<�-CX�����I���L�����?~Wҵczm�V����\"?�9�q�����?���BK�����|��\\͌tB�|��v�J��!+W�O:����tR�Z�U3�Z���>m��O1����Ѩ北S1}#�������Ҙ�����̈�\r�S�,���r5Y�iW�vT�ڭbc��d�o�����w�Q����M����3��>W��\0sVLt��=g8(W3#�;7rE�4�/oR���\"���y:?� ���E��]ajW�ڭ׮X5m��;��K�y���꧵�3��Y�����	\0�FLt�	p�|��\\͌�r�=����P����`��3�Mɚ�X5�+N�������ϟ��׼�5���կ�,���GFF�5o��\0�Ј��`�)g8(W3#/W�%+v._�\\O�*~\nZ�:-Y���v*}��6�S��T��u�<\0`8�D���Y�|����!�/rOd[����[k�׌�u���/#�G~�6rM���U�uQ~ܸ�L������O�|q����U�stN�sV�����GΈ|9���\"��uN�|:������	��\"Ǧ�E>��#���D+1������\Z��U?	�A��E������-1�wܮ��7ğ��,�?/��c�\Zy]��&Q��]���k*>��E�)�/��h���/�u���!�w��c��F�:Ɵ��J��ȓ\"�}\\m�Np��q^�\\?/W;*Y���v���뎋U��>\0��b�>=R��+W�|P:��e�#��Ns��K�.��%K�<&���B*\rQ ��JD,Z*Q ��JF�=;���|����#/��/N�$J�KSY�e#�L%&��:�X�8��M�\'�G���6~1�t�����}��8 r`�1~p���a��c�{#GƲ�\"GG>���x��D���ȧk���lm��<��t�3b��E�Q/�ߎ���ﰦ����xy�$��x�\\Y�Im�tn����TF��M���s�rU�̑r������k�iW�z)VM�>/\0�[j�;�>t��N�����W\"�k��\\?�6,z*������S	����魀���u\Z�Ez^�`��\0��I�s����{�o*U��?@��ռ�G(��(�g+s������-��#D;:r��,����y����m]�8й��=�tZ�R�T�r����^>[)x��KU���v�*?�5��5��\0sWL�k\"��ǁ������$�xN��|�l���jG��U���]�J��jw��n\nV��\0�CLؗW��g��@�)W�/���\\uZ�ZuZl&+V��ny\'���\0ç^���R�<5�O��|�l�H�S�vũ�X5�[oGk��\0íV��ldd�	�8��U��g+CR��ɊN��ԮX5�[�]����@yD��U�^T>��r��������]��}^�Ū�]�Zֲ�����ruk��l>�_��U�e�le��U��֢�I�j��~��@yE�ڶp���@��\\I�a�J���Q:��i�j��?.\0��NQ�����P���!-WI��P�\0��˗Ϗr�5C�*~��\\%�*D�z\0Q�^�Vo�ǁ�P���!/WI�Ũ���p�T*���ji�f�rU���\\%�-Hӽ\0�(VO�l�ǁ�P�������ۢ���\0P.�z�iQ���ǁ�P����������z\0P^###ϪV�?�ǁ�P������d��4�r\0 �b��Z��:C�*~JX���\n�d�\0@.�Ղ���80�U�S�r��E*�\Z\0ؑz���(W��ǁ�P������Y��m�*V\0Щ(W��V�_�ǁ�P������䅵Z-�(V\0Ѝ(V�(X����`(Wŏr��-��7\0����<rr>�rU�(W�\0LKL�{E��ǁ�P���J��i����U�����`�Z���;�s��#[�l�,���|���r\0���Q���ǁ��袋nشiӄ�z)F.����D�*����+\0���@WF�ǁ�8���Z���\r6����$����֭;;����.�v+�\n\0�!&�Dޞ���v��ё�����)DҶHۤ��*Q�\0`\Z���G��j�X$\0l�\\�4D�:>\n֛�q\0�K��i�	�SQ�v��(/�\n\0�!&��#�|��R�\0`\Zb=�Z�P^�\0LC��FFF^��P^�\0LCL������\0��r\0���s�q\0�K��i�	��j���|��R�\0`\Z���O+��S�q\0�K��i�	�g###O��(/�\n\0�!&�_���G��\0��r\0�譕Je�|��R�\0`\Zbݶp���\0��r\0��)&���A\0�M��.-_�|~L�[�q\0�M��.E�zx�Z�%�ܔ+\0�R�RytL���q\0�M��.����Ȧ|�rS�\0�K�z�i1�^��Pn�\0tidd�Y�j�G�8\0�\\@��X=/&���8\0�\\@�b�\\9?�ܔ+\0�R�^EL����(7�\n\0���U�j�+�8\0�\\@��Xբ`���Pn�\0t)&�呓�q\0�M��.��W�|�rS�\0�K�z}�j���|�rS�\0�KQ����|�rS�\0�K1y����Pn�\0t)&�Dޞ�Pn�\0t�^��Z�Pn�\0t)���Q�ޔ�Pn�\0t)&�OE��=�ܔ+\0�RL��G��8\0�\\@�b�<�Z�Pn�\0t)��Y###/��(7�\n\0����z���8\0�\\@�b�\\yn>@�)W\0Х�</�V����(7�\n\0�T��Z�T���Pn�\0t)&ϟ���<!�ܔ+\0�RL�������(7�\n\0��筕Je�|�rS�\0�K1yn[�p�C�q\0�M����&O�v�\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��y��>M�u\0\0\0\0IEND�B`�',1),('3',1,'processes/MyProcess.myProcess.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0�\0\0\0\Z�<\0\06IDATx^��\r�\\u}/�`mM{�b��Z��T[��V����K��VS$�6���$�*��*�DP�J}A*pQ�\n����@D�HIQ#(�@Hx���gg�������잝��<������������|sfΙ7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`��j�1��|�\0\0�`2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S����_{�_�f�]�V�\Z;�s�\09��s����9���۬��\0�#�)��W_��.�`lӦMcw�y��]w�%H�i�D��#��.�v+�\0��d\n��z��;�N|�s/��ƍo�r�:�nec>\0��La��[�*nҶ�r�5�nec>\0��La���{�z)V�6ʷ[٘\0�G&S�N���n��ғǮ<���INc�z��(W�\0����ru�-7��;�б��8�IciY���7ʕ�\0\0zf2���\\]w��&�f����֗�F�2\0@�L�0x�����?jB�j&-�ח�F�����|��|\0�!�\n��r�JU3iY���7%/W�Pm��۸U�\0`:�+<��)q�j�f�ʿ\0:�\\��uR����R�LZ��/�MI��dEj�q\0`G�+�N�Ն���P��I�����)a���@M�\0�)W0x����o��غo6�X���,__�����N�S��\0�r��I�J���L(Wi,_O����nS��@y)W0x��m��6|�	�*��e֗��$�j�Ei���rQ�`�*W��r����?6�X5���u��I�R�r�kA���\00��+�I�նmc�7�7v�YO(Ty�:i]G��!/W�*F�z\0N�^�r5�Ѫ��(�`2��߅�ߏ\0�C���kW�:9Z5Y�}�Ǔ�2��*/B;Evo�v#�_��\0@�\\��+Wya�6��Io�r��T�N���g��`Mv���\0�\n�]��be��U�Ⓨ<��c3���b�̲���\0��r��\\?CT�&+<�Ҏ\nV��Ol�����@�(W0}��sr�RyJ>�S���\"����:?� ��TE�]ajW�ڭ׮X5M�}��+������^��622�|y�rU��\\����nJV��]qj-X��X5u��`x)W0}-;��S�V�Үd)W�OA�U�%��bӮ@���f��b����\0��\\����	���y^s=��)x��Qɚn�iW��ξ�X5M��\0�ܧ\\�����ͳ}gX�*~�H�z��ռދL���K�j��y�ܔ&�|��r���X���.\\��]w���-Z��J��s��z���G-Y��1�������G��N�P�V�*��X�ב�Mos��]��јŋ� ~n^�v�b�?E^�^�����n�����E��qKblYd���b|E�y�}K��bl���\"��;\"��C#+#�G�ˎ��{�?b��#������\"\'DN�e��|:rj|����\"_�|9rF��o�}ϊuΉ?��\\�0rqdu����b�E~^�*ru�ȵ��G��M���s�rU���v�N���͟??�~���w)�0?b��N�H�+���\0Zi��ǘ�\Z;`�E�l�l�2q[��\Z�9��ȯ\"��\\W/�4l�������K��T2���Kj��㻵�2r~m��|;���7\"_����/��K���sJ��|2��Dm�}�6^�>�(KGG�j�����K�a��up�t9�Q�������\"+\"��e{T�K�h}���x�{uu���2�0��(�/���������c��\"yv*�Q<�Q/�O����\'7Jh*������m$���r��N%���j��#�3Sˋ�9r�*��-hY��#D;:r��,����y�ܔ&�|���v���ou�h�n�zE/W;\Z����*/U��[d���V�k����M��\0��g\'|8ٮ3�e���v��I��|yQR�r��RժۂծX��X�;[`�+�׾���G����\'�����[�+�����P�>�lי��br����|Y+�j��EI��U���U�k�b���\\uR���(X/i|>3}����Ȗ�b���}yCz�m�<h�\0\00��	N��̘�T5)W�//J�T�z0U�jW�Z�US��vT�v�}+��6>���xm�Tm��wD.��������oc����\0s����d��r5��dH�U2Y�iW����v�+X�}�Z�t�Kg�b�o�^�R?#g*\\ߋ�c��t2�tB���\0PXv��Z,���ˋ�!*WI�³��΋US����ey��3m�J�Q��1���񳌦3���(��G\"Kҙ;.\0\n�N�p�]����]fjyQ2d�*ɋOkQ�X5Mv���\"]�/\n�K�pX��C����d}\'������_����\0�c\'|8ٮ�R�r%��r��(�t��\"��/�e��u��u�����m��\Z=������:��\0�N�p�]�E�*~��\\%�.B�~��X�lٟT���׾�#_��\"��(Z���/L�������\0���\'۵X���g��UүBԯǙK�.��(\\�����W#7D~cgE�zo��Ց���\0��N�p�]�E�*~��\\%��^�_�J��Q�^��+#gF6Gn��o���E�?��\0�>�l�bQ�����d�i����p=6��n�yD䛑�\"��|=rXd�z����~\00����d��rU���\\%��n�\nQ���5�Z���ّ�D���9$��+b�?��@��	N�k�(W�O��U�ia�t�R�2��xm}]��s#���<�([,�yD~?\0�TL\0秝�)r~~?枴-�1f�rU���\\%S���������\Z�`c��5rm��G�?��������!/�ڔ�<��1��m��1{��⧄�*��@M6��v���W�\Z<�P��(Y��톸=-n�O�gGGG�{~G\0�ڎ�^9j5$��bQ������$/R���h�ʕ����x]^\Z�h仑ۣl�4n�_d�ȋ*��C��Pp��Z���ܔ�g>��Q������Y��m�*VE���p�M�V/�|,�:rG�\'��D�-��]w�����P0��G��\Z\"�U�(W�O��U��,[�`���p=3^���|<��Ȗ���#o�<w������0�j�^-��c�R��E�*~����̊+~?^��W䍑\"�5\n��#{E!���>$�/\03����W�Z\r�X���G�b��T*���IŪQ�R�J�+�T�VD�zv*f�}���^-ȗ3�)WŢ\\?�sYz�`��?�6�����\\��Q��[���>��0��0�/\0}Rk��Ǚ�l�bY�j��w�y�z)F�l�rY����v��,�#��G��^�:rem��k\"�F���j��k��`\Zj��W�8s��Z,]t�\r�6m��S/���_��(W����&��=�E��/rj�t�G.���&~i:m|:}|~_:�8����o���V��(n�����s:��o����E�)����_{�_�f�]�V���V�������Ŝ{��]x�לw�y��mVF�U����x��uÆ\r?w�8�mq��u�Ύא͑]��e�hѢ��N��#ok\\�8]�8]�������G��=5V�)�/�nO��/4\nk~�eC������?&�����C\\p�X�_h;I�I�i��N�v���\"J?��Ց��Ȭ%m��MJ����є�����A��ǜrm�w��|0�@-\n�S�)\\ۥϲ�r\Z�6[��nsr<�#��Ck���wx{Oq�q��[��R���&�@�c\00]Q�;�/��3�/E~%떸=7n���*�\'��v��U�\"�(IQP�;찱�O>9�����~���{�w��o���k׎}�s�;����r���x����C)����&m�����v+�\n�AKGX\"��9�������n�|;��{M������:��÷��n�r�-c\'�xb^�R�O�-��0T�[I�z)V�6ʷ[�(W\0̆(��9h�(V�|-����M�oE���ݢp=6��\\�(V��t�����{SW֯_?v���kk|�����F���[7�]{��cW�{���?��|=��+�\n��9�ϣ �\ZyO��o��7F~93�2�^�dɒ���+�����馛�4-魃_��Wǖ.]�Z�&)ê�ru�-7��;�б��8�IciY���7ʕr@����>.Jʫ\"�ruV�[����j�Б�����g��f[�3V��V�3�<3�G}����Z�n���ɟ�y�����ڄb���W~}����(W�\0sO�\'���E�l��.}~��/G�xW,��e��$�_���?�������k-\'�HG�)}v+;�uUz��9��ru��GM(Uͤe����(W�^�(W������/�h-��{�m�\Zg(��_��c���/�u�8�_��q���x�5N/?�ַ��X�뭀;�>��R�Rޞ?/��:)W��Y9�T5����KS�r�\n��Ⱦ�[�a�S�����S�Btt��j�����\\���%Q�v���N�g�fqi��׽�����+�q��G�W�J�1�n�Ο�,R<������u�!�r����e����wttt,���#���G>�ӎ=��7�\\�҅�Z(W�O��U�X5U�5\0��R���1\Z�p���\"�G�G>cD���E�=,�cz�a������w1vJs�����������7?���>7fQ*J�y�{.y��_�T7��+ƾ��/�����o�}����w���+V<9̲�\\��楪��,__�����Ɋ�d�\00�b��A�J�FyZ9&\n��\"wD�JE)���B�������r���������W4�u{�~��KZ�ۆֿ+��裏�g���+��_���6ۡ-[�l?J��{:蠏�m�L:)W.>vB�j&-�ח����j�5�r\0zQ�~ott�Q����g��K���6Ū�M�礓]4����ِ�^�>����g�?fH:Zu�!�|����?]���V������7m�}��_��2�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]\0J!��M��sw�����]_�e���k}^�\Z8�����i���vꩧ��}���6��K/�tlŊw��^�E�x�}�Y\'�*e�>3�\\��|=�JT��-Lݮ\0C�Z��֦LmO,�-n/�����[����`��c�i}�_��>X*Vo}�[���h�d�n�:v�I\'ݽdɒ�e*X��m��6|�	�*��e֗��$�j�Ei����������{\"�\\D���������y\nf�7����r�������#V�*V��:����n����FS���o�al���P��I��:���)A�� �z\0��\Zg�Xd�]D8��Q�����,�6n��Z��˟\'�>c��\n8��.��sϛ���i��F���m��6o8o슳�P��uҺ�b\r&C^��U���8\00�\ZG����~~̦[�{���a��)�tV�t����ׯ�7�ս����gش+WS��,�b\r&C\\��]���x\00t�Q�\"�J\'�s�j�5�x�L�0w����a{`�r��Ѫɒ�?���!-Wy�)�{����������o��w���Ϙ��R�|�j&q���YL��8��k�E���5Lڕ��0u���a��P*F\'E��3�vZ�&�_��\0P\n��D6���W��,һ�Z/����4Kͧ?��|xƴ^H8=���Ȁ��~w�C��%6��R�ϟ�0iW��X�rծ��#O���L\'��X5��ey��\0C���3>�mw-������?<���1\'�pB���`�w��V�\\��w����b&5�]�T��?�a�\\?CT�&+<�Ҏ\nV��Ol������P���/lS�&͞{���Θ�������H�;���g��_����0����7ޜZ~���.~PϏ,��s�U�S�r���US�v��]�j�^�b�4������g���y�jI*4ߎ���馛��߁��O�����b&s�1��]�6�3����\r�9x����+W�O��UG?W�NN���Z��-�Q�j������p�T����׭�#��i���]�x����@��\Z|�����c�߃x���w�l���K_��/js�&m~���+W�OA���Zt[l�����ڌwR���}\00\'D�zz:[��ߌ�.���6����sZ�[��<3wzgZ���g�?~S(�����<�ES���X���+��R��V�������?W\r�-4�\n��������>\0(����?�rT�|\"��t�g��T�6��=���l��*�=-��S�x��ۏ(\rZ:p2::�����)�~&6�T���i��ϯ�_�vپ3�\\?s�\\=��j^�E�]��X5���\0`F��Q-^��Q��s���\"g���T*����\'�|Cc^�4�yt�<ɏ^}��_�w��*���e�������e���\0��^��m�7�x��l�q��\\?�6+z�rl�����z���V���U�:��\"=�T����\0�]1�>1�ӛ��K������#�d�$��?�����ǥ�Uź͗�j���ҥKzr�SO=����?(�-p6�\Zݴf͚/Ԇ�3W͜_�#o�7������d��z��ռޏ���U��v���\0}�JP��]c.�Xd}m�3R��b5\Z�������>ǔ�x�������s]s>OG��}p#�J�*{;�q�sa����w�z6�\Z�t�)�||.^5�����^�v46��EI��U۟����v�*?�5��5��\0��S�_>;��;�\\\Z����1v`�iy~�A��_��ܞ�`�}���.񴤢��V��t����G�u�Q��U����w�O��a��+�w~��,/J\nZ�v�sբ�BӮX��X�;[`7���\0}�dɒ�D��=����)���#Q�����?��y���R�R�>���n�-�5�H:oB:+`v�j{��ꭊ�G?���y�膭�Cp���ȳ��Wt���*W�//J\nV�:���tZl&+V��ny\'���\0}��9�x��Ƽ��H��ͱ_���}}���϶4�ײ���o����I�l�2v�W�ױj�8G�f���������m޼9�n3f���W���\r�j��EI��U�*8�Sk�jj�ގ\n�T�\0��R����w�?��[��[�V���]�re�\'d\Z�t@!��Uy1z��p�	\'�0v�%�l�&V�\\R�,�ƍ�����c�����f�	9��� ��w�;��3��3c=�����[��\\M��(�r�LVt��vŪ����\n�d�\0�\"��#�8,��œj�\'��e���}u,�9_.HG�����q��	e����~���$Z�ߥ�W�q1��}�{�U�[����r5��d��UҮ��>��b�Ԯ`-kY���\0@OR�h�\0��%�[c�k������e��\\�JQ��ټfV�I%3����I��o<�裏�?/?�t�m��3::�a�->æ��]fjyQ2d�*ɋOkQ�X5Mv���`ڢ4�E����٣Gs.��?�_�bŊ���F������E��,R�ӿM�~0���Lژ��.��Ҽ\r�A�>t�!}�+>æ��J�3��*�P*F��S�Ū)�_��\0ЕE�=,�Ea�ϴ?�e�S��J����0猎��gŊwmݺ5�A}w��g�_����o��1����gH�U��\"����҉&b��9�����w҉(�)��������ׇ���{\\x�I\'ݝ��~��������6~�vɿ��R���!.WI�\nQ���}�?�,�uZ��:n��?���T*��C\'~��dɒ�Gu�o�9��-�JŪZ���a�\\?C^��^�Q��`ȥ�z�>޿D��uE�7��E�}\\�>�B:s_�|w�=��y����]�l\n����X�����U�rU���\\%�-Hӽ\0C�^��u��\"g5�9uQ䐑���ל����!�{�������I�[Og�_�\re��UN�*~JR��n�R��0Ė-[�\'�?W�}�Oƾ��������W�����Z��L��r����a�ڵWEW��l�-�?��7����,�N3�me8+�d���D�*�0u�\0C�q��ž�{����[#_����\ZK0\r�����Q�2]��>��z�)�||͚5_�����}��[ׯ_�g���#�<���������9���wB�*~JV�����T�R����T�b?�F��4�ŋ�cY�93\"�E�½��㋛����߷̔�⧄�*��@M6�Jo�}��b��k\"7DNn�����\0�J�*~JZ���H�_0d҉&�8�}�C\"6NDqv�GY?�!�U�S�r�4U�D�b0�*��c�8�%����)��E�����2.�������*yaz�o��\00���􎌌�<^�?��Tm�\"������V�>���\\?�������ߠH���|��~~͚5w�Z�j�Ϩ�~�=���.���k�;�E�6��6::���־x=�v�~6>+�ל�F���y)V�6ʷ[�(W�r��W�.۴i�؝w�9�gVf\'i[�m��x��%�n0���&\"�x��Tm�$�D���tr�E�=,_`((Wŏr�\\��ի�H;��Ϫ#7n�%^7V��\r)�=�ԋ���}��k���q�����_���U�V�����-[�\\;I[��V6�U���z�(nҶ��LH�����D��Zm��S�B�GD^�.�0�.���tqs����@+WE�w��7���9�ǯ��6r}�^�d�V�-[�\'��\0��>��jժ[7l����?�۶m�06W���u�֝;H�}vB�*�N���n��ғǮ<���INc�z��(W�C:�����?�k��QT�ճ���ǟ�:_�y�w�vIGG��H҄<�O}j,���s8i[�mR�b�(WŒ~F��<��r�غ�[���4����K��Q�ݠ��������G>�M��G��2�2ל(��\0�F����U�tR����k�U3�_��	�K�\\m�t`�]w��(N����x��I��gcl�%K�<&_�!�h��N���i�r�>�X:)WW�ԄR�LZ��/��r�����db��ۘ;��s\Zל� r���������(�t6��64�U��|�>�X:)W��Y9�T5����KS�r�,V�6nK_�*�ʟ���H�O�����ȱ�������\0�T�Zݷ�X�l�����z�m�U�(W�O��U~�*��b��x�\\��ȸ��qͩ/G��eO���y˗/x��Z�U��u�۔�b�\\��楪��,__�����Ɋ�d�C%\n�_E�\Z��_��.�&r��ŋ_��S\0L)&������?t�x��3w)W��I��p�JU3iY���7%,WS����9�Je��^��\'D6E~9�^�/�e����I����$r{^�����m�}����b�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]��b���(Sϋ�;^/n���q�_�==_\0:V�:��RՒͮ�1<��b�\\�l��g&��4��\'�O��U�����gU��GyzC�~!rsdm|��/~���\0]k�JgLo���M�j��=�/s�rU,��m��6|�	�*��e֗��$�j�Ei���tͩ������#�wU�����ju��50cb�yUL>_i����)1��|=�&�X�*W��r����?6�X5���u��I�R�r�kA�����S�]ό��x�[�x���1��ȳ���\00p1	�bR:-g8(W�2i�ڶml��Ʈ8��	�*OZ\'��(�`2��_Ũ_�ӕ��Y�k���*ru�a�D^�t�����\03.&��5Z�U��+WS��,�b\r&C\\��]���x�kN-^��%�:��(P?���F�Y��e��\0�.&��\"����Xڕ�N�VM�t���i�ʋPz�\\�lm�o���?nϢP=5^��-rfm��S�#+#�Og����Bi�����8�A�*�v�*/L�&<�-CX�����I���L�����?~Wҵczm�V����\"?�9�q�����?���BK�����|��\\͌tB�|��v�J��!+W�O:����tR�Z�U3�Z���>m��O1����Ѩ北S1}#�������Ҙ�����̈�\r�S�,���r5Y�iW�vT�ڭbc��d�o�����w�Q����M����3��>W��\0sVLt��=g8(W3#�;7rE�4�/oR���\"���y:?� ���E��]ajW�ڭ׮X5m��;��K�y���꧵�3��Y�����	\0�FLt�	p�|��\\͌�r�=����P����`��3�Mɚ�X5�+N�������ϟ��׼�5���կ�,���GFF�5o��\0�Ј��`�)g8(W3#/W�%+v._�\\O�*~\nZ�:-Y���v*}��6�S��T��u�<\0`8�D���Y�|����!�/rOd[����[k�׌�u���/#�G~�6rM���U�uQ~ܸ�L������O�|q����U�stN�sV�����GΈ|9���\"��uN�|:������	��\"Ǧ�E>��#���D+1������\Z��U?	�A��E������-1�wܮ��7ğ��,�?/��c�\Zy]��&Q��]���k*>��E�)�/��h���/�u���!�w��c��F�:Ɵ��J��ȓ\"�}\\m�Np��q^�\\?/W;*Y���v���뎋U��>\0��b�>=R��+W�|P:��e�#��Ns��K�.��%K�<&���B*\rQ ��JD,Z*Q ��JF�=;���|����#/��/N�$J�KSY�e#�L%&��:�X�8��M�\'�G���6~1�t�����}��8 r`�1~p���a��c�{#GƲ�\"GG>���x��D���ȧk���lm��<��t�3b��E�Q/�ߎ���ﰦ����xy�$��x�\\Y�Im�tn����TF��M���s�rU�̑r������k�iW�z)VM�>/\0�[j�;�>t��N�����W\"�k��\\?�6,z*������S	����魀���u\Z�Ez^�`��\0��I�s����{�o*U��?@��ռ�G(��(�g+s������-��#D;:r��,����y����m]�8й��=�tZ�R�T�r����^>[)x��KU���v�*?�5��5��\0sWL�k\"��ǁ������$�xN��|�l���jG��U���]�J��jw��n\nV��\0�CLؗW��g��@�)W�/���\\uZ�ZuZl&+V��ny\'���\0ç^���R�<5�O��|�l�H�S�vũ�X5�[oGk��\0íV��ldd�	�8��U��g+CR��ɊN��ԮX5�[�]����@yD��U�^T>��r��������]��}^�Ū�]�Zֲ�����ruk��l>�_��U�e�le��U��֢�I�j��~��@yE�ڶp���@��\\I�a�J���Q:��i�j��?.\0��NQ�����P���!-WI��P�\0��˗Ϗr�5C�*~��\\%�*D�z\0Q�^�Vo�ǁ�P���!/WI�Ũ���p�T*���ji�f�rU���\\%�-Hӽ\0�(VO�l�ǁ�P�������ۢ���\0P.�z�iQ���ǁ�P����������z\0P^###ϪV�?�ǁ�P������d��4�r\0 �b��Z��:C�*~JX���\n�d�\0@.�Ղ���80�U�S�r��E*�\Z\0ؑz���(W��ǁ�P������Y��m�*V\0Щ(W��V�_�ǁ�P������䅵Z-�(V\0Ѝ(V�(X����`(Wŏr��-��7\0����<rr>�rU�(W�\0LKL�{E��ǁ�P���J��i����U�����`�Z���;�s��#[�l�,���|���r\0���Q���ǁ��袋nشiӄ�z)F.����D�*����+\0���@WF�ǁ�8���Z���\r6����$����֭;;����.�v+�\n\0�!&�Dޞ���v��ё�����)DҶHۤ��*Q�\0`\Z���G��j�X$\0l�\\�4D�:>\n֛�q\0�K��i�	�SQ�v��(/�\n\0�!&��#�|��R�\0`\Zb=�Z�P^�\0LC��FFF^��P^�\0LCL������\0��r\0���s�q\0�K��i�	��j���|��R�\0`\Z���O+��S�q\0�K��i�	�g###O��(/�\n\0�!&�_���G��\0��r\0�譕Je�|��R�\0`\Zbݶp���\0��r\0��)&���A\0�M��.-_�|~L�[�q\0�M��.E�zx�Z�%�ܔ+\0�R�RytL���q\0�M��.����Ȧ|�rS�\0�K�z�i1�^��Pn�\0tidd�Y�j�G�8\0�\\@��X=/&���8\0�\\@�b�\\9?�ܔ+\0�R�^EL����(7�\n\0���U�j�+�8\0�\\@��Xբ`���Pn�\0t)&�呓�q\0�M��.��W�|�rS�\0�K�z}�j���|�rS�\0�KQ����|�rS�\0�K1y����Pn�\0t)&�Dޞ�Pn�\0t�^��Z�Pn�\0t)���Q�ޔ�Pn�\0t)&�OE��=�ܔ+\0�RL��G��8\0�\\@�b�<�Z�Pn�\0t)��Y###/��(7�\n\0����z���8\0�\\@�b�\\yn>@�)W\0Х�</�V����(7�\n\0�T��Z�T���Pn�\0t)&ϟ���<!�ܔ+\0�RL�������(7�\n\0��筕Je�|�rS�\0�K1yn[�p�C�q\0�M����&O�v�\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��y��>M�u\0\0\0\0IEND�B`�',1),('5002',1,'processes/MyProcess.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"申请请假\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"请假天数\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"请假类型\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"请假人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"请假人ID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"部门审核\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人ID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"总经理审核\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"是否同意\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"审批人id\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"审批人姓名\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5003',1,'processes/MyProcess.myProcess.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0�\0\0\0\Z�<\0\06IDATx^��\r�\\u}/�`mM{�b��Z��T[��V����K��VS$�6���$�*��*�DP�J}A*pQ�\n����@D�HIQ#(�@Hx���gg�������잝��<������������|sfΙ7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`��j�1��|�\0\0�`2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S\0�\0��d\n@b>\0��LH�\0�#�)\0��\0\0zd2 1\0@�L�\0$�\0����|\0\0=2���\0�G&S����_{�_�f�]�V�\Z;�s�\09��s����9���۬��\0�#�)��W_��.�`lӦMcw�y��]w�%H�i�D��#��.�v+�\0��d\n��z��;�N|�s/��ƍo�r�:�nec>\0��La��[�*nҶ�r�5�nec>\0��La���{�z)V�6ʷ[٘\0�G&S�N���n��ғǮ<���INc�z��(W�\0����ru�-7��;�б��8�IciY���7ʕ�\0\0zf2���\\]w��&�f����֗�F�2\0@�L�0x�����?jB�j&-�ח�F�����|��|\0�!�\n��r�JU3iY���7%/W�Pm��۸U�\0`:�+<��)q�j�f�ʿ\0:�\\��uR����R�LZ��/�MI��dEj�q\0`G�+�N�Ն���P��I�����)a���@M�\0�)W0x����o��غo6�X���,__�����N�S��\0�r��I�J���L(Wi,_O����nS��@y)W0x��m��6|�	�*��e֗��$�j�Ei���rQ�`�*W��r����?6�X5���u��I�R�r�kA���\00��+�I�նmc�7�7v�YO(Ty�:i]G��!/W�*F�z\0N�^�r5�Ѫ��(�`2��߅�ߏ\0�C���kW�:9Z5Y�}�Ǔ�2��*/B;Evo�v#�_��\0@�\\��+Wya�6��Io�r��T�N���g��`Mv���\0�\n�]��be��U�Ⓨ<��c3���b�̲���\0��r��\\?CT�&+<�Ҏ\nV��Ol�����@�(W0}��sr�RyJ>�S���\"����:?� ��TE�]ajW�ڭ׮X5M�}��+������^��622�|y�rU��\\����nJV��]qj-X��X5u��`x)W0}-;��S�V�Үd)W�OA�U�%��bӮ@���f��b����\0��\\����	���y^s=��)x��Qɚn�iW��ξ�X5M��\0�ܧ\\�����ͳ}gX�*~�H�z��ռދL���K�j��y�ܔ&�|��r���X���.\\��]w���-Z��J��s��z���G-Y��1�������G��N�P�V�*��X�ב�Mos��]��јŋ� ~n^�v�b�?E^�^�����n�����E��qKblYd���b|E�y�}K��bl���\"��;\"��C#+#�G�ˎ��{�?b��#������\"\'DN�e��|:rj|����\"_�|9rF��o�}ϊuΉ?��\\�0rqdu����b�E~^�*ru�ȵ��G��M���s�rU���v�N���͟??�~���w)�0?b��N�H�+���\0Zi��ǘ�\Z;`�E�l�l�2q[��\Z�9��ȯ\"��\\W/�4l�������K��T2���Kj��㻵�2r~m��|;���7\"_����/��K���sJ��|2��Dm�}�6^�>�(KGG�j�����K�a��up�t9�Q�������\"+\"��e{T�K�h}���x�{uu���2�0��(�/���������c��\"yv*�Q<�Q/�O����\'7Jh*������m$���r��N%���j��#�3Sˋ�9r�*��-hY��#D;:r��,����y�ܔ&�|���v���ou�h�n�zE/W;\Z����*/U��[d���V�k����M��\0��g\'|8ٮ3�e���v��I��|yQR�r��RժۂծX��X�;[`�+�׾���G����\'�����[�+�����P�>�lי��br����|Y+�j��EI��U���U�k�b���\\uR���(X/i|>3}����Ȗ�b���}yCz�m�<h�\0\00��	N��̘�T5)W�//J�T�z0U�jW�Z�US��vT�v�}+��6>���xm�Tm��wD.��������oc����\0s����d��r5��dH�U2Y�iW����v�+X�}�Z�t�Kg�b�o�^�R?#g*\\ߋ�c��t2�tB���\0PXv��Z,���ˋ�!*WI�³��΋US����ey��3m�J�Q��1���񳌦3���(��G\"Kҙ;.\0\n�N�p�]����]fjyQ2d�*ɋOkQ�X5Mv���\"]�/\n�K�pX��C����d}\'������_����\0�c\'|8ٮ�R�r%��r��(�t��\"��/�e��u��u�����m��\Z=������:��\0�N�p�]�E�*~��\\%�.B�~��X�lٟT���׾�#_��\"��(Z���/L�������\0���\'۵X���g��UүBԯǙK�.��(\\�����W#7D~cgE�zo��Ց���\0��N�p�]�E�*~��\\%��^�_�J��Q�^��+#gF6Gn��o���E�?��\0�>�l�bQ�����d�i����p=6��n�yD䛑�\"��|=rXd�z����~\00����d��rU���\\%��n�\nQ���5�Z���ّ�D���9$��+b�?��@��	N�k�(W�O��U�ia�t�R�2��xm}]��s#���<�([,�yD~?\0�TL\0秝�)r~~?枴-�1f�rU���\\%S���������\Z�`c��5rm��G�?��������!/�ڔ�<��1��m��1{��⧄�*��@M6��v���W�\Z<�P��(Y��톸=-n�O�gGGG�{~G\0�ڎ�^9j5$��bQ������$/R���h�ʕ����x]^\Z�h仑ۣl�4n�_d�ȋ*��C��Pp��Z���ܔ�g>��Q������Y��m�*VE���p�M�V/�|,�:rG�\'��D�-��]w�����P0��G��\Z\"�U�(W�O��U��,[�`���p=3^���|<��Ȗ���#o�<w������0�j�^-��c�R��E�*~����̊+~?^��W䍑\"�5\n��#{E!���>$�/\03����W�Z\r�X���G�b��T*���IŪQ�R�J�+�T�VD�zv*f�}���^-ȗ3�)WŢ\\?�sYz�`��?�6�����\\��Q��[���>��0��0�/\0}Rk��Ǚ�l�bY�j��w�y�z)F�l�rY����v��,�#��G��^�:rem��k\"�F���j��k��`\Zj��W�8s��Z,]t�\r�6m��S/���_��(W����&��=�E��/rj�t�G.���&~i:m|:}|~_:�8����o���V��(n�����s:��o����E�)����_{�_�f�]�V���V�������Ŝ{��]x�לw�y��mVF�U����x��uÆ\r?w�8�mq��u�Ύא͑]��e�hѢ��N��#ok\\�8]�8]�������G��=5V�)�/�nO��/4\nk~�eC������?&�����C\\p�X�_h;I�I�i��N�v���\"J?��Ց��Ȭ%m��MJ����є�����A��ǜrm�w��|0�@-\n�S�)\\ۥϲ�r\Z�6[��nsr<�#��Ck���wx{Oq�q��[��R���&�@�c\00]Q�;�/��3�/E~%떸=7n���*�\'��v��U�\"�(IQP�;찱�O>9�����~���{�w��o���k׎}�s�;����r���x����C)����&m�����v+�\n�AKGX\"��9�������n�|;��{M������:��÷��n�r�-c\'�xb^�R�O�-��0T�[I�z)V�6ʷ[�(W\0̆(��9h�(V�|-����M�oE���ݢp=6��\\�(V��t�����{SW֯_?v���kk|�����F���[7�]{��cW�{���?��|=��+�\n��9�ϣ �\ZyO��o��7F~93�2�^�dɒ���+�����馛�4-魃_��Wǖ.]�Z�&)ê�ru�-7��;�б��8�IciY���7ʕr@����>.Jʫ\"�ruV�[����j�Б�����g��f[�3V��V�3�<3�G}����Z�n���ɟ�y�����ڄb���W~}����(W�\0sO�\'���E�l��.}~��/G�xW,��e��$�_���?�������k-\'�HG�)}v+;�uUz��9��ru��GM(Uͤe����(W�^�(W������/�h-��{�m�\Zg(��_��c���/�u�8�_��q���x�5N/?�ַ��X�뭀;�>��R�Rޞ?/��:)W��Y9�T5����KS�r�\n��Ⱦ�[�a�S�����S�Btt��j�����\\���%Q�v���N�g�fqi��׽�����+�q��G�W�J�1�n�Ο�,R<������u�!�r����e����wttt,���#���G>�ӎ=��7�\\�҅�Z(W�O��U�X5U�5\0��R���1\Z�p���\"�G�G>cD���E�=,�cz�a������w1vJs�����������7?���>7fQ*J�y�{.y��_�T7��+ƾ��/�����o�}����w���+V<9̲�\\��楪��,__�����Ɋ�d�\00�b��A�J�FyZ9&\n��\"wD�JE)���B�������r���������W4�u{�~��KZ�ۆֿ+��裏�g���+��_���6ۡ-[�l?J��{:蠏�m�L:)W.>vB�j&-�ח����j�5�r\0zQ�~ott�Q����g��K���6Ū�M�礓]4����ِ�^�>����g�?fH:Zu�!�|����?]���V������7m�}��_��2�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]\0J!��M��sw�����]_�e���k}^�\Z8�����i���vꩧ��}���6��K/�tlŊw��^�E�x�}�Y\'�*e�>3�\\��|=�JT��-Lݮ\0C�Z��֦LmO,�-n/�����[����`��c�i}�_��>X*Vo}�[���h�d�n�:v�I\'ݽdɒ�e*X��m��6|�	�*��e֗��$�j�Ei����������{\"�\\D���������y\nf�7����r�������#V�*V��:����n����FS���o�al���P��I��:���)A�� �z\0��\Zg�Xd�]D8��Q�����,�6n��Z��˟\'�>c��\n8��.��sϛ���i��F���m��6o8o슳�P��uҺ�b\r&C^��U���8\00�\ZG����~~̦[�{���a��)�tV�t����ׯ�7�ս����gش+WS��,�b\r&C\\��]���x\00t�Q�\"�J\'�s�j�5�x�L�0w����a{`�r��Ѫɒ�?���!-Wy�)�{����������o��w���Ϙ��R�|�j&q���YL��8��k�E���5Lڕ��0u���a��P*F\'E��3�vZ�&�_��\0P\n��D6���W��,һ�Z/����4Kͧ?��|xƴ^H8=���Ȁ��~w�C��%6��R�ϟ�0iW��X�rծ��#O���L\'��X5��ey��\0C���3>�mw-������?<���1\'�pB���`�w��V�\\��w����b&5�]�T��?�a�\\?CT�&+<�Ҏ\nV��Ol������P���/lS�&͞{���Θ�������H�;���g��_����0����7ޜZ~���.~PϏ,��s�U�S�r���US�v��]�j�^�b�4������g���y�jI*4ߎ���馛��߁��O�����b&s�1��]�6�3����\r�9x����+W�O��UG?W�NN���Z��-�Q�j������p�T����׭�#��i���]�x����@��\Z|�����c�߃x���w�l���K_��/js�&m~���+W�OA���Zt[l�����ڌwR���}\00\'D�zz:[��ߌ�.���6����sZ�[��<3wzgZ���g�?~S(�����<�ES���X���+��R��V�������?W\r�-4�\n��������>\0(����?�rT�|\"��t�g��T�6��=���l��*�=-��S�x��ۏ(\rZ:p2::�����)�~&6�T���i��ϯ�_�vپ3�\\?s�\\=��j^�E�]��X5���\0`F��Q-^��Q��s���\"g���T*����\'�|Cc^�4�yt�<ɏ^}��_�w��*���e�������e���\0��^��m�7�x��l�q��\\?�6+z�rl�����z���V���U�:��\"=�T����\0�]1�>1�ӛ��K������#�d�$��?�����ǥ�Uź͗�j���ҥKzr�SO=����?(�-p6�\Zݴf͚/Ԇ�3W͜_�#o�7������d��z��ռޏ���U��v���\0}�JP��]c.�Xd}m�3R��b5\Z�������>ǔ�x�������s]s>OG��}p#�J�*{;�q�sa����w�z6�\Z�t�)�||.^5�����^�v46��EI��U۟����v�*?�5��5��\0��S�_>;��;�\\\Z����1v`�iy~�A��_��ܞ�`�}���.񴤢��V��t����G�u�Q��U����w�O��a��+�w~��,/J\nZ�v�sբ�BӮX��X�;[`7���\0}�dɒ�D��=����)���#Q�����?��y���R�R�>���n�-�5�H:oB:+`v�j{��ꭊ�G?���y�膭�Cp���ȳ��Wt���*W�//J\nV�:���tZl&+V��ny\'���\0}��9�x��Ƽ��H��ͱ_���}}���϶4�ײ���o����I�l�2v�W�ױj�8G�f���������m޼9�n3f���W���\r�j��EI��U�*8�Sk�jj�ގ\n�T�\0��R����w�?��[��[�V���]�re�\'d\Z�t@!��Uy1z��p�	\'�0v�%�l�&V�\\R�,�ƍ�����c�����f�	9��� ��w�;��3��3c=�����[��\\M��(�r�LVt��vŪ����\n�d�\0�\"��#�8,��œj�\'��e���}u,�9_.HG�����q��	e����~���$Z�ߥ�W�q1��}�{�U�[����r5��d��UҮ��>��b�Ԯ`-kY���\0@OR�h�\0��%�[c�k������e��\\�JQ��ټfV�I%3����I��o<�裏�?/?�t�m��3::�a�->æ��]fjyQ2d�*ɋOkQ�X5Mv���`ڢ4�E����٣Gs.��?�_�bŊ���F������E��,R�ӿM�~0���Lژ��.��Ҽ\r�A�>t�!}�+>æ��J�3��*�P*F��S�Ū)�_��\0ЕE�=,�Ea�ϴ?�e�S��J����0猎��gŊwmݺ5�A}w��g�_����o��1����gH�U��\"����҉&b��9�����w҉(�)��������ׇ���{\\x�I\'ݝ��~��������6~�vɿ��R���!.WI�\nQ���}�?�,�uZ��:n��?���T*��C\'~��dɒ�Gu�o�9��-�JŪZ���a�\\?C^��^�Q��`ȥ�z�>޿D��uE�7��E�}\\�>�B:s_�|w�=��y����]�l\n����X�����U�rU���\\%�-Hӽ\0C�^��u��\"g5�9uQ䐑���ל����!�{�������I�[Og�_�\re��UN�*~JR��n�R��0Ė-[�\'�?W�}�Oƾ��������W�����Z��L��r����a�ڵWEW��l�-�?��7����,�N3�me8+�d���D�*�0u�\0C�q��ž�{����[#_����\ZK0\r�����Q�2]��>��z�)�||͚5_�����}��[ׯ_�g���#�<���������9���wB�*~JV�����T�R����T�b?�F��4�ŋ�cY�93\"�E�½��㋛����߷̔�⧄�*��@M6�Jo�}��b��k\"7DNn�����\0�J�*~JZ���H�_0d҉&�8�}�C\"6NDqv�GY?�!�U�S�r�4U�D�b0�*��c�8�%����)��E�����2.�������*yaz�o��\00���􎌌�<^�?��Tm�\"������V�>���\\?�������ߠH���|��~~͚5w�Z�j�Ϩ�~�=���.���k�;�E�6��6::���־x=�v�~6>+�ל�F���y)V�6ʷ[�(W�r��W�.۴i�؝w�9�gVf\'i[�m��x��%�n0���&\"�x��Tm�$�D���tr�E�=,_`((Wŏr�\\��ի�H;��Ϫ#7n�%^7V��\r)�=�ԋ���}��k���q�����_���U�V�����-[�\\;I[��V6�U���z�(nҶ��LH�����D��Zm��S�B�GD^�.�0�.���tqs����@+WE�w��7���9�ǯ��6r}�^�d�V�-[�\'��\0��>��jժ[7l����?�۶m�06W���u�֝;H�}vB�*�N���n��ғǮ<���INc�z��(W�C:�����?�k��QT�ճ���ǟ�:_�y�w�vIGG��H҄<�O}j,���s8i[�mR�b�(WŒ~F��<��r�غ�[���4����K��Q�ݠ��������G>�M��G��2�2ל(��\0�F����U�tR����k�U3�_��	�K�\\m�t`�]w��(N����x��I��gcl�%K�<&_�!�h��N���i�r�>�X:)WW�ԄR�LZ��/��r�����db��ۘ;��s\Zל� r���������(�t6��64�U��|�>�X:)W��Y9�T5����KS�r�,V�6nK_�*�ʟ���H�O�����ȱ�������\0�T�Zݷ�X�l�����z�m�U�(W�O��U~�*��b��x�\\��ȸ��qͩ/G��eO���y˗/x��Z�U��u�۔�b�\\��楪��,__�����Ɋ�d�C%\n�_E�\Z��_��.�&r��ŋ_��S\0L)&������?t�x��3w)W��I��p�JU3iY���7%,WS����9�Je��^��\'D6E~9�^�/�e����I����$r{^�����m�}����b�\\�|Ï��}��	�*��e���ߔ�\\uZ�:]��b���(Sϋ�;^/n���q�_�==_\0:V�:��RՒͮ�1<��b�\\�l��g&��4��\'�O��U�����gU��GyzC�~!rsdm|��/~���\0]k�JgLo���M�j��=�/s�rU,��m��6|�	�*��e֗��$�j�Ei���tͩ������#�wU�����ju��50cb�yUL>_i����)1��|=�&�X�*W��r����?6�X5���u��I�R�r�kA�����S�]ό��x�[�x���1��ȳ���\00p1	�bR:-g8(W�2i�ڶml��Ʈ8��	�*OZ\'��(�`2��_Ũ_�ӕ��Y�k���*ru�a�D^�t�����\03.&��5Z�U��+WS��,�b\r&C\\��]���x�kN-^��%�:��(P?���F�Y��e��\0�.&��\"����Xڕ�N�VM�t���i�ʋPz�\\�lm�o���?nϢP=5^��-rfm��S�#+#�Og����Bi�����8�A�*�v�*/L�&<�-CX�����I���L�����?~Wҵczm�V����\"?�9�q�����?���BK�����|��\\͌tB�|��v�J��!+W�O:����tR�Z�U3�Z���>m��O1����Ѩ北S1}#�������Ҙ�����̈�\r�S�,���r5Y�iW�vT�ڭbc��d�o�����w�Q����M����3��>W��\0sVLt��=g8(W3#�;7rE�4�/oR���\"���y:?� ���E��]ajW�ڭ׮X5m��;��K�y���꧵�3��Y�����	\0�FLt�	p�|��\\͌�r�=����P����`��3�Mɚ�X5�+N�������ϟ��׼�5���կ�,���GFF�5o��\0�Ј��`�)g8(W3#/W�%+v._�\\O�*~\nZ�:-Y���v*}��6�S��T��u�<\0`8�D���Y�|����!�/rOd[����[k�׌�u���/#�G~�6rM���U�uQ~ܸ�L������O�|q����U�stN�sV�����GΈ|9���\"��uN�|:������	��\"Ǧ�E>��#���D+1������\Z��U?	�A��E������-1�wܮ��7ğ��,�?/��c�\Zy]��&Q��]���k*>��E�)�/��h���/�u���!�w��c��F�:Ɵ��J��ȓ\"�}\\m�Np��q^�\\?/W;*Y���v���뎋U��>\0��b�>=R��+W�|P:��e�#��Ns��K�.��%K�<&���B*\rQ ��JD,Z*Q ��JF�=;���|����#/��/N�$J�KSY�e#�L%&��:�X�8��M�\'�G���6~1�t�����}��8 r`�1~p���a��c�{#GƲ�\"GG>���x��D���ȧk���lm��<��t�3b��E�Q/�ߎ���ﰦ����xy�$��x�\\Y�Im�tn����TF��M���s�rU�̑r������k�iW�z)VM�>/\0�[j�;�>t��N�����W\"�k��\\?�6,z*������S	����魀���u\Z�Ez^�`��\0��I�s����{�o*U��?@��ռ�G(��(�g+s������-��#D;:r��,����y����m]�8й��=�tZ�R�T�r����^>[)x��KU���v�*?�5��5��\0sWL�k\"��ǁ������$�xN��|�l���jG��U���]�J��jw��n\nV��\0�CLؗW��g��@�)W�/���\\uZ�ZuZl&+V��ny\'���\0ç^���R�<5�O��|�l�H�S�vũ�X5�[oGk��\0íV��ldd�	�8��U��g+CR��ɊN��ԮX5�[�]����@yD��U�^T>��r��������]��}^�Ū�]�Zֲ�����ruk��l>�_��U�e�le��U��֢�I�j��~��@yE�ڶp���@��\\I�a�J���Q:��i�j��?.\0��NQ�����P���!-WI��P�\0��˗Ϗr�5C�*~��\\%�*D�z\0Q�^�Vo�ǁ�P���!/WI�Ũ���p�T*���ji�f�rU���\\%�-Hӽ\0�(VO�l�ǁ�P�������ۢ���\0P.�z�iQ���ǁ�P����������z\0P^###ϪV�?�ǁ�P������d��4�r\0 �b��Z��:C�*~JX���\n�d�\0@.�Ղ���80�U�S�r��E*�\Z\0ؑz���(W��ǁ�P������Y��m�*V\0Щ(W��V�_�ǁ�P������䅵Z-�(V\0Ѝ(V�(X����`(Wŏr��-��7\0����<rr>�rU�(W�\0LKL�{E��ǁ�P���J��i����U�����`�Z���;�s��#[�l�,���|���r\0���Q���ǁ��袋nشiӄ�z)F.����D�*����+\0���@WF�ǁ�8���Z���\r6����$����֭;;����.�v+�\n\0�!&�Dޞ���v��ё�����)DҶHۤ��*Q�\0`\Z���G��j�X$\0l�\\�4D�:>\n֛�q\0�K��i�	�SQ�v��(/�\n\0�!&��#�|��R�\0`\Zb=�Z�P^�\0LC��FFF^��P^�\0LCL������\0��r\0���s�q\0�K��i�	��j���|��R�\0`\Z���O+��S�q\0�K��i�	�g###O��(/�\n\0�!&�_���G��\0��r\0�譕Je�|��R�\0`\Zbݶp���\0��r\0��)&���A\0�M��.-_�|~L�[�q\0�M��.E�zx�Z�%�ܔ+\0�R�RytL���q\0�M��.����Ȧ|�rS�\0�K�z�i1�^��Pn�\0tidd�Y�j�G�8\0�\\@��X=/&���8\0�\\@�b�\\9?�ܔ+\0�R�^EL����(7�\n\0���U�j�+�8\0�\\@��Xբ`���Pn�\0t)&�呓�q\0�M��.��W�|�rS�\0�K�z}�j���|�rS�\0�KQ����|�rS�\0�K1y����Pn�\0t)&�Dޞ�Pn�\0t�^��Z�Pn�\0t)���Q�ޔ�Pn�\0t)&�OE��=�ܔ+\0�RL��G��8\0�\\@�b�<�Z�Pn�\0t)��Y###/��(7�\n\0����z���8\0�\\@�b�\\yn>@�)W\0Х�</�V����(7�\n\0�T��Z�T���Pn�\0t)&ϟ���<!�ܔ+\0�RL�������(7�\n\0��筕Je�|�rS�\0�K1yn[�p�C�q\0�M����&O�v�\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ��y��>M�u\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('batch.schema.version','6.5.0.6',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.5.0.6',1),('entitylink.schema.version','6.5.0.6',1),('eventsubscription.schema.version','6.5.0.6',1),('identitylink.schema.version','6.5.0.6',1),('job.schema.version','6.5.0.6',1),('next.dbid','7501',4),('schema.history','create(6.5.0.6)',1),('schema.version','6.5.0.6',1),('task.schema.version','6.5.0.6',1),('variable.schema.version','6.5.0.6',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_entitylink`
--

DROP TABLE IF EXISTS `act_hi_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_entitylink`
--

LOCK TABLES `act_hi_entitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_tsk_log`
--

DROP TABLE IF EXISTS `act_hi_tsk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_tsk_log`
--

LOCK TABLES `act_hi_tsk_log` WRITE;
/*!40000 ALTER TABLE `act_hi_tsk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_tsk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_bytearray`
--

DROP TABLE IF EXISTS `act_id_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_bytearray`
--

LOCK TABLES `act_id_bytearray` WRITE;
/*!40000 ALTER TABLE `act_id_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv`
--

DROP TABLE IF EXISTS `act_id_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv`
--

LOCK TABLES `act_id_priv` WRITE;
/*!40000 ALTER TABLE `act_id_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv_mapping`
--

DROP TABLE IF EXISTS `act_id_priv_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv_mapping`
--

LOCK TABLES `act_id_priv_mapping` WRITE;
/*!40000 ALTER TABLE `act_id_priv_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_property`
--

DROP TABLE IF EXISTS `act_id_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_property`
--

LOCK TABLES `act_id_property` WRITE;
/*!40000 ALTER TABLE `act_id_property` DISABLE KEYS */;
INSERT INTO `act_id_property` VALUES ('schema.version','6.5.0.6',1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_token`
--

DROP TABLE IF EXISTS `act_id_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_token`
--

LOCK TABLES `act_id_token` WRITE;
/*!40000 ALTER TABLE `act_id_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1',NULL,NULL,NULL,'','2020-09-17 06:51:40',NULL,NULL,NULL,NULL),('2501',NULL,NULL,NULL,'','2020-09-18 06:14:27',NULL,NULL,NULL,NULL),('5001',NULL,NULL,NULL,'','2020-09-22 09:49:46',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('myProcess:1:4',1,'http://www.activiti.org/test','My process','myProcess',1,'1','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('myProcess:2:2504',1,'http://www.activiti.org/test','My process','myProcess',2,'2501','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('myProcess:3:5004',1,'http://www.activiti.org/test','My process','myProcess',3,'5001','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_actinst`
--

DROP TABLE IF EXISTS `act_ru_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_actinst`
--

LOCK TABLES `act_ru_actinst` WRITE;
/*!40000 ALTER TABLE `act_ru_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_entitylink`
--

DROP TABLE IF EXISTS `act_ru_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_entitylink`
--

LOCK TABLES `act_ru_entitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_history_job`
--

DROP TABLE IF EXISTS `act_ru_history_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_history_job`
--

LOCK TABLES `act_ru_history_job` WRITE;
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL COMMENT 'id序号',
  `dept_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门名称',
  `dept_manager` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门主管',
  `parent_dept_id` int(11) DEFAULT NULL COMMENT '父级部门',
  `dept_emp_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `dept_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_channel_definition`
--

DROP TABLE IF EXISTS `flw_channel_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_channel_definition`
--

LOCK TABLES `flw_channel_definition` WRITE;
/*!40000 ALTER TABLE `flw_channel_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_channel_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangelog`
--

DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ev_databasechangelog` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangelog`
--

LOCK TABLES `flw_ev_databasechangelog` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangelog` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangelog` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2020-09-17 14:51:35',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'3.8.7',NULL,NULL,'0325495870');
/*!40000 ALTER TABLE `flw_ev_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangeloglock`
--

DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ev_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangeloglock`
--

LOCK TABLES `flw_ev_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_definition`
--

DROP TABLE IF EXISTS `flw_event_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_definition`
--

LOCK TABLES `flw_event_definition` WRITE;
/*!40000 ALTER TABLE `flw_event_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_deployment`
--

DROP TABLE IF EXISTS `flw_event_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_deployment`
--

LOCK TABLES `flw_event_deployment` WRITE;
/*!40000 ALTER TABLE `flw_event_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_resource`
--

DROP TABLE IF EXISTS `flw_event_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_resource`
--

LOCK TABLES `flw_event_resource` WRITE;
/*!40000 ALTER TABLE `flw_event_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch`
--

DROP TABLE IF EXISTS `flw_ru_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `COMPLETE_TIME_` datetime DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch`
--

LOCK TABLES `flw_ru_batch` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch_part`
--

DROP TABLE IF EXISTS `flw_ru_batch_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `COMPLETE_TIME_` datetime DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch_part`
--

LOCK TABLES `flw_ru_batch_part` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL COMMENT '是否完成',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'完成五杀',0,NULL,1,'2020-08-26 14:28:49','2020-08-26 14:28:53');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `option_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作类型',
  `option_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作内容',
  `option_user` int(20) DEFAULT NULL COMMENT '操作用户',
  `option_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人名称',
  `option_ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人ip',
  `option_remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:51:34'),(2,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:51:34'),(3,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:53:04'),(4,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:54:58'),(5,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:55:50'),(6,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:55:54'),(7,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:56:03'),(8,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:58:28'),(9,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:59:31'),(10,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 14:19:30'),(11,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:19:30'),(12,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:23:19'),(13,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:29:57'),(14,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:32:28'),(15,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:33:20'),(16,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:34:00'),(17,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:37:04'),(18,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:55:02'),(19,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:58:23'),(20,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:58:37'),(21,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:20:57'),(22,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:20:58'),(23,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:21:40'),(24,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:21:53'),(25,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:22:46'),(26,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:23:07'),(27,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:23:22'),(28,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:23:22'),(29,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:24:29'),(30,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:24:38'),(31,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:24:38'),(32,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:26:33'),(33,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:26:45'),(34,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:26:45'),(35,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:48:30'),(36,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:48:43'),(37,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:48:51'),(38,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:50:22'),(39,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:53:33'),(40,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:53:34'),(41,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:55:42'),(42,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:55:51'),(43,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:56:40'),(44,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:56:40'),(45,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:57:28'),(46,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:57:32'),(47,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 11:58:30'),(48,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:58:40'),(49,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 11:58:43'),(50,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 12:03:09'),(51,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 12:03:17'),(52,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 13:43:18'),(53,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:43:18'),(54,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 13:55:20'),(55,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:55:20'),(56,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 13:55:27'),(57,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:55:27'),(58,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:55:29'),(59,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 13:55:35'),(60,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 13:56:27'),(61,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:56:29'),(62,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 13:56:56'),(63,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:14:39'),(64,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:18:56'),(65,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:18:56'),(66,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:19:03'),(67,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:22:26'),(68,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:22:42'),(69,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:25:47'),(70,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:27:58'),(71,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:28:19'),(72,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:31:42'),(73,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:32:36'),(74,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:34:53'),(75,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:53:15'),(76,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:56:48'),(77,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 14:58:22'),(78,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 14:58:22'),(79,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:02:01'),(80,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:02:07'),(81,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:03:02'),(82,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:11:08'),(83,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:12:55'),(84,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:14:19'),(85,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:16:27'),(86,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:17:00'),(87,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:45:12'),(88,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:46:27'),(89,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:47:00'),(90,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:48:06'),(91,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:48:37'),(92,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:49:22'),(93,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:49:27'),(94,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:50:03'),(95,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:50:05'),(96,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:50:26'),(97,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:51:38'),(98,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:51:41'),(99,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:54:54'),(100,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:54:57'),(101,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:57:10'),(102,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:57:30'),(103,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:57:33'),(104,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 15:59:29'),(105,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:59:29'),(106,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 15:59:33'),(107,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:02:27'),(108,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:02:29'),(109,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:02:53'),(110,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:02:53'),(111,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:06:21'),(112,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:06:21'),(113,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:07:22'),(114,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:07:48'),(115,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:09:34'),(116,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:09:48'),(117,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:09:48'),(118,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:10:04'),(119,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:10:14'),(120,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:11:50'),(121,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:12:14'),(122,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:12:21'),(123,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:12:21'),(124,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:13:19'),(125,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:13:19'),(126,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:14:08'),(127,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:14:08'),(128,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:15:09'),(129,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:15:09'),(130,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:15:55'),(131,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:16:24'),(132,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:16:24'),(133,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:18:31'),(134,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:20:51'),(135,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:20:52'),(136,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:39:21'),(137,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:39:21'),(138,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:40:11'),(139,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:40:14'),(140,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:40:22'),(141,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:40:31'),(142,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:40:53'),(143,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:43:32'),(144,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:43:32'),(145,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:43:48'),(146,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:46:16'),(147,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:49:25'),(148,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:50:40'),(149,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 16:58:39'),(150,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 16:58:39'),(151,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:00:07'),(152,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:00:07'),(153,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:00:11'),(154,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:08:47'),(155,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:08:48'),(156,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:10:31'),(157,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:19:05'),(158,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:19:23'),(159,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:19:33'),(160,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:19:36'),(161,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:19:53'),(162,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:19:57'),(163,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:20:49'),(164,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:21:10'),(165,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:24:44'),(166,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:27:38'),(167,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:27:38'),(168,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:28:28'),(169,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:28:28'),(170,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:29:03'),(171,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:29:03'),(172,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:29:08'),(173,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:30:46'),(174,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:30:50'),(175,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:34:36'),(176,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:34:42'),(177,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-29 17:36:36'),(178,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:36:36'),(179,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-29 17:42:46'),(180,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-30 08:31:29'),(181,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-30 08:31:29'),(182,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-30 13:42:45'),(183,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-30 13:42:45'),(184,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-30 17:11:03'),(185,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:22:17'),(186,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:22:18'),(187,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:24:03'),(188,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:24:15'),(189,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:24:49'),(190,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:26:32'),(191,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:27:02'),(192,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:27:09'),(193,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:27:50'),(194,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:28:31'),(195,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:28:32'),(196,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:28:43'),(197,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:28:58'),(198,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:28:58'),(199,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:29:36'),(200,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:29:36'),(201,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:30:10'),(202,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:30:11'),(203,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:31:21'),(204,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:32:28'),(205,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:32:36'),(206,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 09:54:35'),(207,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 09:59:22'),(208,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:22:15'),(209,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:22:26'),(210,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:28:30'),(211,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:31:37'),(212,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:31:52'),(213,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:33:20'),(214,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:34:35'),(215,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:35:33'),(216,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:35:45'),(217,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:37:13'),(218,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:39:51'),(219,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:46:19'),(220,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:46:32'),(221,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:48:15'),(222,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:48:37'),(223,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:49:54'),(224,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 10:54:50'),(225,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 11:00:32'),(226,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 11:01:29'),(227,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 11:02:37'),(228,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 11:05:25'),(229,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 14:01:42'),(230,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 14:22:41'),(231,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 14:32:05'),(232,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 14:33:17'),(233,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 14:40:38'),(234,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 14:49:12'),(235,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 14:54:34'),(236,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 14:54:49'),(237,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:00:40'),(238,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:01:34'),(239,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:02:48'),(240,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:23:30'),(241,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:24:53'),(242,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:26:29'),(243,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:27:04'),(244,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:28:00'),(245,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:29:51'),(246,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:31:51'),(247,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:32:07'),(248,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:35:38'),(249,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:43:02'),(250,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:43:48'),(251,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:44:22'),(252,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:44:35'),(253,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:52:34'),(254,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:55:48'),(255,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:55:49'),(256,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:56:03'),(257,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 15:56:41'),(258,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 15:56:41'),(259,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 16:00:30'),(260,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-31 16:14:55'),(261,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 16:14:55'),(262,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-31 16:25:29'),(263,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-06 17:10:58'),(264,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:10:58'),(265,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:14:57'),(266,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:16:56'),(267,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:18:45'),(268,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:23:02'),(269,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:23:30'),(270,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:25:43'),(271,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:27:02'),(272,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:28:37'),(273,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:29:48'),(274,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:30:26'),(275,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:30:55'),(276,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:31:20'),(277,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:31:51'),(278,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:32:32'),(279,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:33:18'),(280,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:33:28'),(281,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:34:03'),(282,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:34:38'),(283,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:34:53'),(284,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-06 17:35:18'),(285,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-19 08:34:56'),(286,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 08:34:56'),(287,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 08:42:31'),(288,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-19 09:36:25'),(289,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 09:36:25'),(290,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 09:40:12'),(291,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 09:46:01'),(292,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 09:48:35'),(293,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 09:55:18'),(294,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:05:26'),(295,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-19 10:06:00'),(296,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:06:53'),(297,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-19 10:07:18'),(298,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:07:18'),(299,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:12:03'),(300,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:12:14'),(301,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:16:58'),(302,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:28:13'),(303,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:37:21'),(304,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:47:17'),(305,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:47:51'),(306,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:48:06'),(307,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:48:49'),(308,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:50:39'),(309,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 10:52:58'),(310,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-19 15:35:33'),(311,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 15:35:33'),(312,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 15:43:01'),(313,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-19 15:43:37'),(314,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 10:52:49'),(315,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 10:52:49'),(316,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 10:57:31'),(317,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 11:05:46'),(318,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 11:53:52'),(319,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 11:53:53'),(320,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 13:34:38'),(321,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:34:38'),(322,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:40:25'),(323,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:50:34'),(324,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:51:49'),(325,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 13:53:30'),(326,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:53:41'),(327,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:56:57'),(328,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 13:57:13'),(329,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:58:03'),(330,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:58:31'),(331,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:59:16'),(332,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 13:59:57'),(333,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:01:59'),(334,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:05:21'),(335,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:08:37'),(336,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:08:58'),(337,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 14:18:49'),(338,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 14:19:14'),(339,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 14:19:31'),(340,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:20:24'),(341,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:22:48'),(342,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:22:58'),(343,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:24:05'),(344,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:30:01'),(345,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:31:05'),(346,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:31:43'),(347,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:31:56'),(348,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:35:47'),(349,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:36:18'),(350,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:37:07'),(351,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:37:43'),(352,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:38:24'),(353,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:38:53'),(354,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 14:38:57'),(355,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 14:47:59'),(356,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-20 15:01:12'),(357,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 15:01:12'),(358,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-20 15:10:28'),(359,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-24 09:47:06'),(360,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:47:06'),(361,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:50:57'),(362,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:53:06'),(363,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:53:21'),(364,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:53:50'),(365,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:54:03'),(366,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:54:20'),(367,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:55:34'),(368,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:55:45'),(369,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:57:36'),(370,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:57:55'),(371,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:59:12'),(372,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 09:59:22'),(373,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-24 16:08:48'),(374,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:08:48'),(375,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:21:51'),(376,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:23:02'),(377,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:23:46'),(378,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:24:01'),(379,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:39:05'),(380,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:41:21'),(381,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:42:15'),(382,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:43:52'),(383,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:44:56'),(384,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:45:15'),(385,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:45:41'),(386,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:49:00'),(387,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-24 16:51:45'),(388,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 09:46:06'),(389,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 09:46:07'),(390,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 10:24:34'),(391,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 10:56:46'),(392,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 10:56:46'),(393,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 10:58:58'),(394,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:00:22'),(395,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:01:14'),(396,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:29:51'),(397,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:40:16'),(398,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:40:33'),(399,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:47:29'),(400,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:55:40'),(401,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 11:58:33'),(402,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 11:58:33'),(403,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 12:00:44'),(404,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 12:01:03'),(405,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 13:35:26'),(406,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 13:35:26'),(407,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 13:38:44'),(408,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 13:39:19'),(409,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 13:50:40'),(410,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:26:28'),(411,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 14:37:09'),(412,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:37:09'),(413,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:50:46'),(414,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:53:37'),(415,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:53:48'),(416,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:53:51'),(417,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 14:55:40'),(418,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:00:26'),(419,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:00:34'),(420,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:01:47'),(421,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:15:19'),(422,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:24:41'),(423,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:28:39'),(424,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:29:24'),(425,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-26 15:42:09'),(426,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:42:09'),(427,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:42:22'),(428,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:42:54'),(429,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:43:36'),(430,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:44:27'),(431,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:44:48'),(432,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-26 15:50:02'),(433,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-31 12:00:43'),(434,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 12:00:44'),(435,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 12:00:53'),(436,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-08-31 13:37:54'),(437,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:37:59'),(438,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:41:30'),(439,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:42:10'),(440,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:42:32'),(441,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:43:01'),(442,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:43:12'),(443,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:43:22'),(444,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 13:50:18'),(445,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-08-31 14:08:09'),(446,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-09-18 14:14:28'),(447,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:14:28'),(448,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:34:49'),(449,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:34:57'),(450,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:35:40'),(451,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:35:53'),(452,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:36:00'),(453,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:36:38'),(454,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-18 14:38:07'),(455,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-09-22 17:52:54'),(456,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-09-22 17:52:54');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `producer` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'关于学习小船警告','针对学习小船经常开车，处以全员净身',1,NULL,'2020-08-26 10:58:44','2020-08-26 10:58:46');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `off_work`
--

DROP TABLE IF EXISTS `off_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `off_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '请假人',
  `off_type` int(255) DEFAULT NULL COMMENT '1:事假 2：病假 3：婚假 4：产假 5:丧假 6：陪产假',
  `off_reason` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '请假理由',
  `off_start_time` datetime NOT NULL COMMENT '请假开始时间',
  `off_end_time` datetime NOT NULL COMMENT '请假结束时间',
  `is_allow` tinyint(1) DEFAULT '0' COMMENT '是否批准(0：未批准 1：已批准)',
  `review_user_id` int(11) DEFAULT NULL COMMENT '审核人',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请假备注',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除(0：未删除 1：已删除)',
  `create_time` datetime DEFAULT NULL COMMENT '创建 时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新 时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_work`
--

LOCK TABLES `off_work` WRITE;
/*!40000 ALTER TABLE `off_work` DISABLE KEYS */;
INSERT INTO `off_work` VALUES (1,1,NULL,'生病','2020-08-26 12:00:20','2020-08-26 18:00:22',0,NULL,NULL,NULL,'2020-08-26 12:00:34',NULL);
/*!40000 ALTER TABLE `off_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT '父权限',
  `perm_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限名称',
  `perm_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT '父角色id',
  `role_zh_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_en_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代码代号',
  `role_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  `role_enable` tinyint(4) DEFAULT NULL COMMENT '角色是否启用',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'超级管理员','admin','系统管理员',1,NULL,NULL),(2,NULL,'总经理','manager','总经理',0,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_perm`
--

DROP TABLE IF EXISTS `role_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(20) NOT NULL COMMENT '角色id',
  `perm_id` int(20) NOT NULL COMMENT '权限id',
  `perm_type` int(20) NOT NULL COMMENT '权限类型（0:可访问，1:可授权）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_perm`
--

LOCK TABLES `role_perm` WRITE;
/*!40000 ALTER TABLE `role_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '编号',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `username` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `dept_id` int(20) DEFAULT NULL COMMENT '所属部门',
  `real_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `gender` smallint(1) unsigned DEFAULT '0' COMMENT '性别：1：男  2：女',
  `age` smallint(10) unsigned DEFAULT NULL COMMENT '年龄',
  `address` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `login_ip` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_account_non_expired` tinyint(1) DEFAULT '1' COMMENT '账号是否过期',
  `is_account_non_locked` tinyint(1) DEFAULT '1' COMMENT '账号是否被锁定',
  `is_enabled` tinyint(1) DEFAULT '0' COMMENT '账号是否可用',
  `is_credentials_non_expired` tinyint(1) DEFAULT '1' COMMENT '凭证是否过期',
  `login_count` int(20) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`,`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hKGGlOEFYh4Rrey36fksySwRrNJIJI0I7UG6ezXk344','https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg','admin','123456',NULL,'江二少',1,23,'重庆丰都','127.0.0.1','2020-03-15 16:30:50','2020-03-15 16:30:48',1,1,1,1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_perm`
--

DROP TABLE IF EXISTS `user_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) unsigned NOT NULL,
  `perm_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_perm`
--

LOCK TABLES `user_perm` WRITE;
/*!40000 ALTER TABLE `user_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(20) unsigned NOT NULL COMMENT '用户',
  `role_id` int(20) unsigned NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'swft'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-22 18:09:46
