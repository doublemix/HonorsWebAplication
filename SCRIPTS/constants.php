<?php

/* User Status(es) */
const USER_STATUS_ADMIN = 1;
const USER_STATUS_STUDENT = 2;
const USER_STATUS_GRADUATE = 3;
const USER_STATUS_INACTIVE = 4;
const USER_STATUS_PROFESSOR = 5;
const USER_STATUS_REMOVED_FROM_PROGRAM = 6;

/* User Education Levels */
const USER_EDUCATION_FRESHMAN = 1;
const USER_EDUCATION_SOPHOMORE = 2;
const USER_EDUCATION_JUNIOR = 3;
const USER_EDUCATION_SENIOR_PLUS = 4;
const USER_EDUCATION_GRADUATE = 5;
const USER_EDUCATION_PROFESSOR = 6; /* also used for admin */

/* Permissions */
const PERM_ADMIN = 0;
const PERM_WORKER = 1;
const PERM_USERS = 2;
const PERM_FDG = 3;
const PERM_EXEMPTIONS = 4;
const PERM_ACADEMIC_EVENTS = 5;
const PERM_ACTIVITY_GROUPS = 6;
const PERM_COMM_SERV = 7;
const PERM_PIF = 8;
const PERM_IMAGE_SLIDES = 9;
const PERM_EVENTS = 10;
const PERM_NEWS = 11;
const PERM_STATS = 12;