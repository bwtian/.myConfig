
phd.mkproject <- function(Project = "phdThesis"){
        # Set Workspace
        wd  <- getwd()
        setwd(wd)
        # Set Variables
        dir0.v   <- as.character(Project)
        proj.v   <- c("frontmatter","chapters","backmatter","reference","published")
        front.v  <- c("00_cover","01_title","02_dedication","03_preface","04_abstract","05_acknowlegment","06_toc","07_glossary","08_accronmys","09_figurelist","10_tablelist", "11_softlist")
        back.v   <- c("Appendix","32_appendixB","33_appendixC","34_declaration","35_bibliography","36_cv","37_resume")
        pub.v    <- c("code","data","plot","paper","presentation")
        chap.v   <- paste0("chapter",1:9)
        thesis.v <- c(proj.v,front.v,chap.v,back.v,pub.v)
      # Make folders and files
        dir.create(dir0.v)
        setwd(paste0("./",dir0.v))
        for (i in proj.v){
            dir.create(i)
        }
        setwd("./published")
        for (i in pub.v){
            dir.create(i)    
        }
        setwd("../frontmatter")
        for (i in front.v){
            orgFn <- paste0(i,".org")
            file.create(orgFn)
        }
        setwd("../backmatter")
        for (i in back.v){
          orgFn <- paste0(i,".org")
          file.create(orgFn)
        }
      # setwd("../chapters")
      # Make chapters folder using ProjectTemplate
        if(!require(ProjectTemplate)){
          install.packages("ProjectTemplate")
          } else {
            for (i in chap.v) {
                create.project(i)
                #setwd(as.character(i))
    #             dir.create("dataraw")
    #             dir.create("datatar")
    #             dir.create("tex")
    #             dir.create("html")
    #             dir.create("figure")
                #setwd("..")
            }
        }
      # Make a org-Todo file for Task-mangerment
        setwd("../")
        for (i in thesis.v){
          todo <- paste("* TODO",i)
          write.table(todo, "thesisTODO.org", append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
        }
      setwd(wd)  
      # TODO: Make R Project for each chapter using Rstudio within git 
      }

    phd.mkthesis <- function(wdProject = "phdThesis"){
      # Set Workspace
      wd  <- getwd()
      setwd(wd)
      # Set Variables
      dir0.v   <- as.character(wdProject)
      chap.v  <- paste0("chapter",0:9)
      proj.v   <- c("frontmatter", chap.v, "backmatter", "reference")
      front.v  <- c("00_cover","01_title","02_dedication","03_preface","04_abstract","05_acknowlegment","06_toc","07_glossary","08_accronmys","09_figurelist","10_tablelist", "11_softlist")
      back.v   <- c("31_appendixA","32_appendixB","33_appendixC","34_declaration","35_bibliography","36_cv","37_resume")
      thesis.v <- c(proj.v, front.v, back.v)
      # Make folders and files
      dir.create(dir0.v)
      setwd(paste0("./",dir0.v))
      for (i in proj.v){
        dir.create(i)
      }
      
      setwd("./frontmatter")
      for (i in front.v){
        orgFn <- paste0(i,".org")
        file.create(orgFn)
      }
      
      setwd("../backmatter")
      for (i in back.v){
        orgFn <- paste0(i,".org")
        file.create(orgFn)
      }
      setwd("..")
      # Make chapters folder using ProjectTemplate
      if(!require(ProjectTemplate)){
        install.packages("ProjectTemplate")
      } else {
        for (i in chap.v) {
          #setwd(as.character(i))
          create.project(i)
          #             dir.create("dataraw")
          #             dir.create("datatar")
          #             dir.create("tex")
          #             dir.create("html")
          #             dir.create("figure")
          #setwd("..")
        }
      }
      # Make a org-Todo file for Task-mangerment
      #setwd("../")
      for (i in thesis.v){
        todo <- paste("* TODO",i)
        write.table(todo, "noteTODO.org", append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
      }
      setwd(wd)  
      # TODO: Make R Project for each chapter using Rstudio within git 
    }

   phd.phd <- function(project = "Dissertation", sub = c("Dissertation", "Paper", "Symposium"),  type = c( "Rnw", "org", "Tex", "docx")) {
    sub <- match.arg(sub)
    type <- match.arg(type)
    wd  <- getwd()
    setwd(wd)
    if (sub == "Paper") {
            sub <- c("Preamble", "Options", "Title", "Abstract", "Introduction",  "StudyArea", "Data", "Methods", "Results", "Discussion", "Conclusion", "Acknowledgment", "Reference", "Appendix","Figures")
    } else if (sub == "Dissertation") {
            sub <- c("Options", "Preamble", "Cover", "Title", "Dedication", "Declaration", "Preface", "Acknowledgment", "Tableofcontents", "Figureslist", "Tableslist", "SoftwaresList", "Glossary", "Acronym", "Nomenclature", "Abstract", "Introduction", "LiteratureReview", "Backgroud", "Data", "Chap1", "Chap2", "Chap3", "Chap4", "chap5", "Discussion", "FutureWork", "Conclusion",  "Reference", "Appendix","Index","Figures", "Publications","Presentaions", "Cv", "Resume")
    }
    # project <- deparse(substitute(sub))
    main <- as.character(project)
    mainfile <- paste0(project, ".", type)
    todofile <- paste0("todo_note_", project, ".org")
    dir.create(main)
    setwd(file.path("./", main))
    for (i in toupper(sub)){
            dir.create(i)
    }
    file.v  <- tolower(sub)
    ### TODO: Copy a template to the Current project
    for (i in file.v){
            fileName  <- paste0(i, ".", type)
            file.create(fileName)
            if (type == "org") { 
            cat(paste0("\n", "* ", "[[", "file:../", todofile, "][", "TODO_NOTE", "]]", "          :noexport:"), file = fileName)
            }
    }
    fileList  <- list.files(pattern = type)
    # dirList  <- list.dirs("./")
    for (i in fileList){
           file.copy(from = i, to = toupper(tools::file_path_sans_ext(i)))
    }
    file.remove(fileList)
    file.create(as.character(mainfile))
    
    for (i in c(main)){
            TODO <- paste0("* TODO ", "[[", "file:./", main, ".", type, "][", i, "]]")
            write.table(TODO, todofile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
    }
    for (i in c(sub)){
            TODO <- paste0("* TODO ", "[[", "file:./",toupper(i), "/", tolower(i), ".", type, "][", i, "]]" )
            prop <- paste0(":PROPERTIES:", "\n", ":CUSTOM_ID: ", i ,"\n", ":END:", "\n")
            child <- paste0("\n", "#+INCLUDE: ", "\"./", toupper(i), "/", tolower(i), ".", type, "\"") 
            write.table(rbind(TODO,prop,child), todofile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
    }
    if (type == "Rnw") {
            for (i in c(sub)){
                    main0 <- paste0("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
                    , "\n", "%% ", "\\input or \\include", "{", toupper(i), "/", tolower(i) , "}" , "\n",  
                    "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                    main1 <- paste0("<<", i, ", child = ", "\"./", toupper(i), "/", tolower(i), ".", type, "\"", ">>=", "\n", "@")
                    write.table(rbind(main0,main1), mainfile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
            }
    }
    if (type == "org") {    
            todolink <- paste0("* ", "[[", "file:./", todofile, "][", "TODO_NOTE", "]]", "          :noexport:" )
            for (i in c(sub)){
                    main1 <- paste0("* ", i)
                    main2 <- paste0(":PROPERTIES:", "\n", ":CUSTOM_ID: ", i ,"\n", ":END:", "\n")
                    main3 <- paste0("#+INCLUDE: ", "\"./", toupper(i), "/", tolower(i), ".", type, "\"")              
                    a <- write.table(rbind(main1,main2,main3), mainfile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
            }
            write.table(rbind(todolink, a), mainfile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
    }
   if (type == "tex") {    
            for (i in c(sub)){
                    main <- paste0("\\input", "{", toupper(i), "/", tolower(i), "}")
                    write.table(main, mainfile, append = TRUE, quote = FALSE,col.names = FALSE,row.names = FALSE)
            }
    }
    setwd(wd)
}
