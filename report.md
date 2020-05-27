







Overview
========

Summary: The goal of this review is to identify the needs for network
analysis of landscape (forests, agriculture, aquatic, built) embodied in
trade to assess the resilience of global human-natural systems to
climate change.

-   Why landscape?
-   Major topics in landscape
    -   Land-use change
    -   Climate change
    -   Invasive/disease organisms
    -   Fire and drought
-   Resilience and sustainability
-   Why MRIO?
-   Multi-regional
-   Multi-industry
-   Why networks, why ENA?
-   System-wide impacts through both direct and indirect pathways
-   Feedbacks and cycling
-   Groups and modules
-   ENA is based on IO Analysis framework
-   Compare Approaches (network vs non-network)
    -   ENA
    -   IO analysis
    -   Telecoupling
    -   Footprint analysis
    -   Other? See Ecol. Econ. 2015 114
    -   Virtual systems?
-   What has been done?
-   What are the priorities?
-   Climate change
-   Land-use change
-   Structural analyses
    -   Targets
    -   Metrics
-   Coupled Industries
-   Comparison of network and non-network metrics

Analyses
========

-   What work has been done on landscape mrio?
-   What work has addressed resilience and stability?
-   What ENA metrics have been or could be applied?

<!-- -->

    loadd(io.bdf)

keyword+title: io/mrio
----------------------

    q.mrio <- grepl("INPUT-OUTPUT", io.bdf[, "DE"]) | 
        grepl("INPUT-OUTPUT", io.bdf[, "TI"]) | 
        grepl("INPUT OUTPUT", io.bdf[, "DE"]) | 
        grepl("INPUT OUTPUT", io.bdf[, "TI"]) 

keyword+title: mrio & landscape
-------------------------------

    q.land <- grepl("^LAND", io.bdf[, "DE"]) | 
        grepl("^LAND", io.bdf[, "TI"]) | 
        grepl(" LAND", io.bdf[, "DE"]) | 
        grepl(" LAND", io.bdf[, "TI"]) 

keyword+title+abstract: forest
------------------------------

    q.for <- grepl("FOREST", io.bdf[, "DE"]) | 
              grepl("FOREST", io.bdf[, "TI"]) |
             grepl("FOREST", io.bdf[, "AB"])

keyword+title: mrio & network/ena
---------------------------------

    q.net <- (grepl("NETWORK ANALYS", io.bdf[, "DE"]) | 
        grepl("NETWORK ANALYS", io.bdf[, "TI"])) & 
        !(grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "DE"]) | 
        grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "TI"]))
    q.ena <- grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "DE"]) | 
        grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "TI"]) &
        !(q.net)

keyword+title: resilience
-------------------------

    q.res <- grepl("^RESILIEN", io.bdf[, "TI"]) | 
        grepl("^RESILIEN", io.bdf[, "DE"]) | 
        grepl(" RESILIEN", io.bdf[, "TI"]) | 
        grepl(" RESILIEN", io.bdf[, "DE"]) 
    q.res.abs <- grepl("^RESILIEN", io.bdf[, "TI"]) | 
        grepl("^RESILIEN", io.bdf[, "DE"]) | 
        grepl(" RESILIEN", io.bdf[, "TI"]) | 
        grepl(" RESILIEN", io.bdf[, "DE"]) | 
        grepl("^RESILIEN", io.bdf[, "AB"]) | 
        grepl(" RESILIEN", io.bdf[, "AB"]) 

keyword+title: disturbance(climate change, other)
-------------------------------------------------

    q.mc <- grepl("^CLIMATE", io.bdf[, "TI"]) | 
        grepl("^CLIMATE", io.bdf[, "DE"]) | 
        grepl(" CLIMATE", io.bdf[, "TI"]) | 
        grepl(" CLIMATE", io.bdf[, "DE"]) 
    q.md <- grepl("^DISTURB", io.bdf[, "TI"]) | 
        grepl("^DISTURB", io.bdf[, "DE"]) | 
        grepl(" DISTURB", io.bdf[, "TI"]) | 
        grepl(" DISTURB", io.bdf[, "DE"]) 

keyword+title: coupled-human natural systems
--------------------------------------------

    q.chns <- grepl("HUMAN-NATURAL", io.bdf[, "TI"]) | 
        grepl("HUMAN-NATURAL", io.bdf[, "DE"]) |
        grepl("HUMAN-NATURAL", io.bdf[, "AB"]) |
        grepl("HUMAN NATURAL", io.bdf[, "TI"]) | 
        grepl("HUMAN NATURAL", io.bdf[, "DE"]) |
        grepl("HUMAN NATURAL", io.bdf[, "AB"]) 

keyword+title: ena & resilience+stability & metrics
---------------------------------------------------

    q.met <- grepl(" METRIC", io.bdf[, "TI"]) | 
        grepl(" METRIC", io.bdf[, "DE"]) |
        grepl(" METRIC", io.bdf[, "AB"]) |
        grepl("^METRIC", io.bdf[, "TI"]) | 
        grepl("^METRIC", io.bdf[, "DE"]) |
        grepl("^METRIC", io.bdf[, "AB"]) & 
        q.net &
        q.res
    q.met.land <- q.met & q.land

type: review
------------

    q.rev <- grepl("REVIEW", io.bdf[, "DT"]) | 
        grepl("REVIEW", io.bdf[, "DE"]) | 
        grepl("REVIEW", io.bdf[, "TI"]) 
    q.ov <- grepl("OVERVIEW", io.bdf[, "DT"]) |
        grepl("OVERVIEW", io.bdf[, "DE"]) | 
        grepl("OVERVIEW", io.bdf[, "TI"]) 

Papers
======

QUERY: IO/MRIO
--------------

    head(io.bdf[q.mrio, c("TI")])

    ## [1] "KAZAKHSTAN'S CO2 EMISSIONS IN THE POST-KYOTO PROTOCOL ERA: PRODUCTION - AND CONSUMPTION-BASED ANALYSIS"                       
    ## [2] "EVOLUTION OF METHANE EMISSIONS IN GLOBAL SUPPLY CHAINS DURING 2000-2012"                                                      
    ## [3] "TESTING THE SDG TARGETS ON WATER AND SANITATION USING THE WORLD TRADE MODEL WITH A WASTE, WASTEWATER, AND RECYCLING FRAMEWORK"
    ## [4] "MULTI-SCALE WATER USE BALANCE FOR A TYPICAL COASTAL CITY IN CHINA"                                                            
    ## [5] "UNDERSTANDING THE TELE-COUPLING MECHANISM OF URBAN FOOD-ENERGY-WATER NEXUS: CRITICAL SOURCES, NODES, AND SUPPLY CHAINS"       
    ## [6] "VIRTUAL WATER FLOW FEATURE OF WATER-RICH PROVINCE AND THE ENLIGHTENMENTS: CASE OF YUNNAN IN CHINA"

QUERY: Reviews/Overviews
------------------------

    io.bdf[q.rev | q.ov, c("TI")]

    ##  [1] "AN INTRODUCTION AND OVERVIEW ON LAW, POLITICS AND GOVERNANCE: INSTITUTIONS, ORGANIZATIONS AND PROCEDURES FOR ECOLOGICAL ECONOMICS"                                     
    ##  [2] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                
    ##  [3] "AN OVERVIEW OF PHYSICAL AND BIOGEOCHEMICAL PROCESSES AND ECOSYSTEM DYNAMICS IN THE TAIWAN STRAIT"                                                                      
    ##  [4] "WHERE NOW FOR POST-NORMAL SCIENCE?: A CRITICAL REVIEW OF ITS DEVELOPMENT, DEFINITIONS, AND USES"                                                                       
    ##  [5] "OECD ORGANISATIONAL DISCOURSE, PEER REVIEWS AND SUSTAINABLE DEVELOPMENT: AN ECOLOGICAL-INSTITUTIONALIST PERSPECTIVE"                                                   
    ##  [6] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                            
    ##  [7] "DESIGNING PAYMENTS FOR ENVIRONMENTAL SERVICES IN THEORY AND PRACTICE: AN OVERVIEW OF THE ISSUES"                                                                       
    ##  [8] "THE CURRENT ORTHODOXY IN ENVIRONMENTAL ECONOMICS: A REVIEW AND A CHALLENGE"                                                                                            
    ##  [9] "CREATING AN ACADEMIC LANDSCAPE OF SUSTAINABILITY SCIENCE: AN ANALYSIS OF THE CITATION NETWORK"                                                                         
    ## [10] "ENVIRONMENT IMPACTS OF PRODUCTS - A DETAILED REVIEW OF STUDIES"                                                                                                        
    ## [11] "THE EAST ASIAN SUMMER MONSOON: AN OVERVIEW"                                                                                                                            
    ## [12] "A REVIEW OF DIFFERING APPROACHES USED TO ESTIMATE THE COST OF CORROSION (AND THEIR RELEVANCE IN THE DEVELOPMENT OF MODERN CORROSION PREVENTION AND CONTROL STRATEGIES)"
    ## [13] "ENERGY AND CO2 LIFE-CYCLE ANALYSES OF WIND TURBINES - REVIEW AND APPLICATIONS"                                                                                         
    ## [14] "SUSTAINABILITY: A REVIEW OF THE DEBATE AND AN EXTENSION"                                                                                                               
    ## [15] "REVIEW OF MODELING TECHNIQUES AND TOOLS FOR DECISION-MAKING IN MANUFACTURING MANAGEMENT"                                                                               
    ## [16] "REVIEW OF THE DECADAL OSCILLATION IN THE STRATOSPHERE OF THE NORTHERN-HEMISPHERE"                                                                                      
    ## [17] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                    
    ## [18] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"                                                                                              
    ## [19] "REVIEW: THE PROJECTED HYDROLOGIC CYCLE UNDER THE SCENARIO OF 936PPM CO2 IN 2100"                                                                                       
    ## [20] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                  
    ## [21] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                 
    ## [22] "TOWARDS A UNIVERSAL CARBON FOOTPRINT STANDARD: A CASE STUDY OF CARBON MANAGEMENT AT UNIVERSITIES"                                                                      
    ## [23] "CRITICAL SYSTEMS THINKING REVIEW ON DECENTRALIZED DRINKING WATER MANAGEMENT IN NAULI CITY, INDONESIA"                                                                  
    ## [24] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                     
    ## [25] "TOURISM AND ECONOMIC GROWTH: A REVIEW OF INTERNATIONAL LITERATURE"                                                                                                     
    ## [26] "GREEN ECONOMY AND RELATED CONCEPTS: AN OVERVIEW"                                                                                                                       
    ## [27] "NATIONAL PATHWAYS TO THE SUSTAINABLE DEVELOPMENT GOALS (SDGS): A COMPARATIVE REVIEW OF SCENARIO MODELLING TOOLS"                                                       
    ## [28] "A TRANSDISCIPLINARY REVIEW OF THE ROLE OF ECONOMICS IN LIFE CYCLE SUSTAINABILITY ASSESSMENT"                                                                           
    ## [29] "METABOLISM AND ENVIRONMENTAL IMPACTS OF HOUSEHOLD CONSUMPTION: A REVIEW ON THE ASSESSMENT, METHODOLOGY, AND DRIVERS"                                                   
    ## [30] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"                                                                  
    ## [31] "HOUSEHOLD CARBON EMISSION RESEARCH: AN ANALYTICAL REVIEW OF MEASUREMENT, INFLUENCING FACTORS AND MITIGATION PROSPECTS"                                                 
    ## [32] "MEASURING TELECOUPLINGS IN THE GLOBAL LAND SYSTEM: A REVIEW AND COMPARATIVE EVALUATION OF LAND FOOTPRINT ACCOUNTING METHODS"                                           
    ## [33] "AN OVERVIEW OF TREE-RING WIDTH RECORDS ACROSS THE NORTHERN HEMISPHERE"                                                                                                 
    ## [34] "QUANTIFYING THE HUMAN IMPACT ON WATER RESOURCES: A CRITICAL REVIEW OF THE WATER FOOTPRINT CONCEPT"                                                                     
    ## [35] "EMPLOYMENT AND FARMERS' WORK IN EUROPEAN RUMINANT LIVESTOCK FARMS: A REVIEW"

QUERY: ENA/Network
------------------

    io.bdf[q.ena | q.ov, c("TI")]

    ##  [1] "AN INTRODUCTION AND OVERVIEW ON LAW, POLITICS AND GOVERNANCE: INSTITUTIONS, ORGANIZATIONS AND PROCEDURES FOR ECOLOGICAL ECONOMICS"                                        
    ##  [2] "EVALUATING CHROMIUM COUPLED WITH CARBON METABOLISM AND ENVIRONMENTAL PERFORMANCE IN THE CHROMATE INDUSTRIAL SYMBIOSIS NETWORK IN CHINA"                                   
    ##  [3] "ECOLOGICAL NETWORK ANALYSIS OF AN ENERGY METABOLISM SYSTEM BASED ON INPUT-OUTPUT TABLES: MODEL DEVELOPMENT AND CASE STUDY FOR GUANGDONG"                                  
    ##  [4] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                   
    ##  [5] "CHARACTERIZING THE EMBODIED CARBON EMISSIONS FLOWS AND ECOLOGICAL RELATIONSHIPS AMONG FOUR CHINESE MEGACITIES AND OTHER PROVINCES"                                        
    ##  [6] "THROUGHFLOW CENTRALITY IS A GLOBAL INDICATOR OF THE FUNCTIONAL IMPORTANCE OF SPECIES IN ECOSYSTEMS"                                                                       
    ##  [7] "IMPROVED ECOLOGICAL NETWORK ANALYSIS FOR ENVIRONMENTAL SUSTAINABILITY ASSESSMENT; A CASE STUDY ON A FOREST ECOSYSTEM"                                                     
    ##  [8] "EQUIVALENCE OF THE REALIZED INPUT AND OUTPUT ORIENTED INDIRECT EFFECTS METRICS IN ECOLOGICAL NETWORK ANALYSIS"                                                            
    ##  [9] "AN OVERVIEW OF PHYSICAL AND BIOGEOCHEMICAL PROCESSES AND ECOSYSTEM DYNAMICS IN THE TAIWAN STRAIT"                                                                         
    ## [10] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                               
    ## [11] "DESIGNING PAYMENTS FOR ENVIRONMENTAL SERVICES IN THEORY AND PRACTICE: AN OVERVIEW OF THE ISSUES"                                                                          
    ## [12] "CREATING AN ACADEMIC LANDSCAPE OF SUSTAINABILITY SCIENCE: AN ANALYSIS OF THE CITATION NETWORK"                                                                            
    ## [13] "A MATLAB (R) FUNCTION FOR NETWORK ENVIRON ANALYSIS"                                                                                                                       
    ## [14] "THE EAST ASIAN SUMMER MONSOON: AN OVERVIEW"                                                                                                                               
    ## [15] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                       
    ## [16] "METABOLISM OF URBAN WASTEWATER: ECOLOGICAL NETWORK ANALYSIS FOR GUANGDONG PROVINCE, CHINA"                                                                                
    ## [17] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"                                                                                                 
    ## [18] "INFORMATION-BASED ECOLOGICAL NETWORK ANALYSIS FOR CARBON EMISSIONS"                                                                                                       
    ## [19] "WATER-LAND NEXUS IN FOOD TRADE BASED ON ECOLOGICAL NETWORK ANALYSIS"                                                                                                      
    ## [20] "ENERGY WATER NEXUS UNDER ENERGY MIX SCENARIOS USING INPUT OUTPUT AND ECOLOGICAL NETWORK ANALYSES"                                                                         
    ## [21] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                     
    ## [22] "ECOLOGICAL NETWORK ANALYSIS FOR AN INDUSTRIAL SOLID WASTE METABOLISM SYSTEM"                                                                                              
    ## [23] "ECOLOGICAL AND ECONOMIC ANALYSES OF THE FOREST METABOLISM SYSTEM: A CASE STUDY OF GUANGDONG PROVINCE, CHINA"                                                              
    ## [24] "ECOLOGICAL NETWORK ANALYSIS ON INTRA-CITY METABOLISM OF FUNCTIONAL URBAN AREAS IN ENGLAND AND WALES"                                                                      
    ## [25] "INTERREGIONAL CARBON FLOWS OF CHINA"                                                                                                                                      
    ## [26] "MULTIREGIONAL INPUT-OUTPUT AND ECOLOGICAL NETWORK ANALYSES FOR REGIONAL ENERGY-WATER NEXUS WITHIN CHINA"                                                                  
    ## [27] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                    
    ## [28] "PROVINCIAL CARBON EMISSIONS REDUCTION ALLOCATION PLAN IN CHINA BASED ON CONSUMPTION PERSPECTIVE"                                                                          
    ## [29] "INTERREGIONAL TRADE AMONG REGIONS OF URBAN ENERGY METABOLISM: A CASE STUDY BETWEEN BEIJING-TIANJIN-HEBEI AND OTHERS IN CHINA"                                             
    ## [30] "MULTI-SCALE ANALYSIS OF THE ENERGY METABOLIC PROCESSES IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION"                                                    
    ## [31] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                        
    ## [32] "ECOLOGICAL UTILITY THEORY: SOLVING A SERIES CONVERGENCE ISSUE"                                                                                                            
    ## [33] "ENERGY-WATER NEXUS OF INTERNATIONAL ENERGY TRADE OF CHINA"                                                                                                                
    ## [34] "ECOLOGICAL NETWORK ANALYSIS OF ENERGY METABOLISM IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION"                                                          
    ## [35] "HIGHLY VARIABLE MALE COURTSHIP BEHAVIORAL SEQUENCES IN A CRAMBID MOTH"                                                                                                    
    ## [36] "ECOLOGICAL NETWORK ANALYSIS OF EMBODIED PARTICULATE MATTER 2.5-A CASE STUDY OF BEIJING"                                                                                   
    ## [37] "GREEN ECONOMY AND RELATED CONCEPTS: AN OVERVIEW"                                                                                                                          
    ## [38] "SIX GENERAL ECOSYSTEM PROPERTIES ARE MORE INTENSE IN BIOGEOCHEMICAL CYCLING NETWORKS THAN FOOD WEBS"                                                                      
    ## [39] "ENERGY-WATER NEXUS OF URBAN AGGLOMERATION BASED ON MULTIREGIONAL INPUT-OUTPUT TABLES AND ECOLOGICAL NETWORK ANALYSIS: A CASE STUDY OF THE BEIJING-TIANJIN-HEBEI REGION"   
    ## [40] "ECOLOGICAL NETWORK ANALYSIS OF EMBODIED ENERGY EXCHANGES AMONG THE SEVEN REGIONS OF CHINA"                                                                                
    ## [41] "ECOLOGICAL NETWORK ANALYSIS OF THE VIRTUAL WATER NETWORK WITHIN CHINA'S ELECTRIC POWER SYSTEM DURING 2007-2012"                                                           
    ## [42] "URBAN ENERGY FLOW PROCESSES IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION: COMBINING MULTI-REGIONAL INPUT-OUTPUT TABLES WITH ECOLOGICAL NETWORK ANALYSIS"
    ## [43] "MULTI-REGIONAL INPUT-OUTPUT MODEL AND ECOLOGICAL NETWORK ANALYSIS FOR REGIONAL EMBODIED ENERGY ACCOUNTING IN CHINA"                                                       
    ## [44] "URBAN ENERGY CONSUMPTION: DIFFERENT INSIGHTS FROM ENERGY FLOW ANALYSIS, INPUT-OUTPUT ANALYSIS AND ECOLOGICAL NETWORK ANALYSIS"                                            
    ## [45] "AN OVERVIEW OF TREE-RING WIDTH RECORDS ACROSS THE NORTHERN HEMISPHERE"                                                                                                    
    ## [46] "ECOLOGICAL NETWORK ANALYSIS OF AN URBAN METABOLIC SYSTEM BASED ON INPUT-OUTPUT TABLES: MODEL DEVELOPMENT AND CASE STUDY FOR BEIJING"                                      
    ## [47] "UNFOLDING INTERREGIONAL ENERGY FLOW STRUCTURE OF CHINA'S CONSTRUCTION SECTOR BASED ON PROVINCE-LEVEL DATA"                                                                
    ## [48] "CHARACTERISTICS OF TIANJIN'S MATERIAL METABOLISM FROM THE PERSPECTIVE OF ECOLOGICAL NETWORK ANALYSIS"                                                                     
    ## [49] "AN ECOLOGICAL-THERMODYNAMIC APPROACH TO URBAN METABOLISM: MEASURING RESOURCE UTILIZATION WITH OPEN SYSTEM NETWORK EFFECTIVENESS ANALYSIS"

    io.bdf[q.net | q.ov, c("TI")]

    ##  [1] "AN INTRODUCTION AND OVERVIEW ON LAW, POLITICS AND GOVERNANCE: INSTITUTIONS, ORGANIZATIONS AND PROCEDURES FOR ECOLOGICAL ECONOMICS"                                                              
    ##  [2] "CARBON COMMUNITIES AND HOTSPOTS FOR CARBON EMISSIONS REDUCTION IN CHINA"                                                                                                                        
    ##  [3] "ENERGY FOOTPRINT PATHWAYS OF CHINA"                                                                                                                                                             
    ##  [4] "A STUDY ON EMBODIED CARBON TRANSFER AT THE PROVINCIAL LEVEL OF CHINA FROM A SOCIAL NETWORK PERSPECTIVE"                                                                                         
    ##  [5] "LINKAGE ANALYSIS OF TOURISM-RELATED SECTORS IN CHINA: AN ASSESSMENT BASED ON NETWORK ANALYSIS TECHNIQUE"                                                                                        
    ##  [6] "ENERGY-INDUCED MERCURY EMISSIONS IN GLOBAL SUPPLY CHAIN NETWORKS: STRUCTURAL CHARACTERISTICS AND POLICY IMPLICATIONS"                                                                           
    ##  [7] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                                         
    ##  [8] "AN OVERVIEW OF PHYSICAL AND BIOGEOCHEMICAL PROCESSES AND ECOSYSTEM DYNAMICS IN THE TAIWAN STRAIT"                                                                                               
    ##  [9] "ECOSYSTEM NETWORK ANALYSIS INDICATORS ARE GENERALLY ROBUST TO PARAMETER UNCERTAINTY IN A PHOSPHORUS MODEL OF LAKE SIDNEY LANIER, USA"                                                           
    ## [10] "APPLYING SOCIAL NETWORK ANALYSIS TO INPUT-OUTPUT BASED INNOVATION MATRICES: AN ILLUSTRATIVE APPLICATION TO SIX OECD TECHNOLOGICAL SYSTEMS FOR THE MIDDLE 1990S"                                 
    ## [11] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                                                     
    ## [12] "DESIGNING PAYMENTS FOR ENVIRONMENTAL SERVICES IN THEORY AND PRACTICE: AN OVERVIEW OF THE ISSUES"                                                                                                
    ## [13] "LEAST-INFERENCE METHODS FOR CONSTRUCTING NETWORKS OF TROPHIC FLOWS"                                                                                                                             
    ## [14] "CREATING AN ACADEMIC LANDSCAPE OF SUSTAINABILITY SCIENCE: AN ANALYSIS OF THE CITATION NETWORK"                                                                                                  
    ## [15] "THEORY OF MATERIALS AND ENERGY FLOW ANALYSIS IN ECOLOGY AND ECONOMICS"                                                                                                                          
    ## [16] "THE EAST ASIAN SUMMER MONSOON: AN OVERVIEW"                                                                                                                                                     
    ## [17] "NETWORK ANALYSIS APPLIED TO LARGE-SCALE CYBER-ECOSYSTEMS"                                                                                                                                       
    ## [18] "NETWORK SYNERGISM: EMERGENCE OF POSITIVE RELATIONS IN ECOLOGICAL SYSTEMS"                                                                                                                       
    ## [19] "CARBON BUDGET AND NETWORK ANALYSIS OF A HIGH-ENERGY BEACH/SURF-ZONE ECOSYSTEM"                                                                                                                  
    ## [20] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                                             
    ## [21] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"                                                                                                                       
    ## [22] "NETWORK ANALYSIS OF DIFFERENT TYPES OF FOOD FLOWS: ESTABLISHING THE INTERACTION BETWEEN FOOD FLOWS AND ECONOMIC FLOWS"                                                                          
    ## [23] "LAND COMPETITION UNDER TELECOUPLING: DISTANT ACTORS' ENVIRONMENTAL VERSUS ECONOMIC CLAIMS ON LAND IN NORTH-EASTERN MADAGASCAR"                                                                  
    ## [24] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                                           
    ## [25] "DYNAMIC INPUT-OUTPUT ANALYSIS FOR ENERGY METABOLISM SYSTEM IN THE PROVINCE OF GUANGDONG, CHINA"                                                                                                 
    ## [26] "EVOLUTION OF THE SCIENTIFIC LITERATURE ON INPUT-OUTPUT ANALYSIS: A BIBLIOMETRIC ANALYSIS OF 1990-2017"                                                                                          
    ## [27] "VISUALIZING THE CHANGE OF EMBODIED CO2 EMISSIONS ALONG GLOBAL PRODUCTION CHAINS"                                                                                                                
    ## [28] "A NETWORK ANALYSIS OF INDIRECT CARBON EMISSION FLOWS AMONG DIFFERENT INDUSTRIES IN CHINA"                                                                                                       
    ## [29] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                                          
    ## [30] "SYSTEMIC RISK IN THE GLOBAL WATER INPUT-OUTPUT NETWORK"                                                                                                                                         
    ## [31] "INDUSTRIAL CHARACTERISTICS AND CONSUMPTION EFFICIENCY FROM A NEXUS PERSPECTIVE - BASED ON ANHUI'S EMPIRICAL STATISTICS"                                                                         
    ## [32] "AN INQUIRY INTO WATER TRANSFER NETWORK OF THE YANGTZE RIVER ECONOMIC BELT IN CHINA"                                                                                                             
    ## [33] "EMERGY NETWORK ANALYSIS OF CHINESE SECTORAL ECOLOGICAL SUSTAINABILITY"                                                                                                                          
    ## [34] "GLOBAL ENERGY FLOWS EMBODIED IN INTERNATIONAL TRADE: A COMBINATION OF ENVIRONMENTALLY EXTENDED INPUT-OUTPUT ANALYSIS AND COMPLEX NETWORK ANALYSIS"                                              
    ## [35] "NETWORK ANALYSIS AS A TOOL FOR QUANTIFYING THE DYNAMICS OF METACOUPLED SYSTEMS: AN EXAMPLE USING GLOBAL SOYBEAN TRADE"                                                                          
    ## [36] "FLOWBCA: A FLOW-BASED CLUSTER ALGORITHM IN STATA"                                                                                                                                               
    ## [37] "EXAMINING INDUSTRIAL STRUCTURE CHANGES AND CORRESPONDING CARBON EMISSION REDUCTION EFFECT BY COMBINING INPUT-OUTPUT ANALYSIS AND SOCIAL NETWORK ANALYSIS: A COMPARISON STUDY OF CHINA AND JAPAN"
    ## [38] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                                              
    ## [39] "IDENTIFY SECTORS' ROLE ON THE EMBEDDED CO2 TRANSFER NETWORKS THROUGH CHINA'S REGIONAL TRADE"                                                                                                    
    ## [40] "NETWORK ANALYSIS OF INTER-SECTORAL RELATIONSHIPS AND KEY SECTORS IN THE GREEK ECONOMY"                                                                                                          
    ## [41] "AN URBAN METABOLISM AND CARBON FOOTPRINT ANALYSIS OF THE JING-JIN-JI REGIONAL AGGLOMERATION"                                                                                                    
    ## [42] "AUSTRALIA'S REGIONAL INNOVATION SYSTEMS: INTER-INDUSTRY INTERACTION IN INNOVATIVE ACTIVITIES IN THREE AUSTRALIAN TERRITORIES"                                                                   
    ## [43] "URBAN ENERGY-WATER NEXUS: A NETWORK PERSPECTIVE"                                                                                                                                                
    ## [44] "GREEN ECONOMY AND RELATED CONCEPTS: AN OVERVIEW"                                                                                                                                                
    ## [45] "UNEQUAL CARBON EXCHANGES THE ENVIRONMENTAL AND ECONOMIC IMPACTS OF ICONIC US CONSUMPTION ITEMS"                                                                                                 
    ## [46] "WEALTH AND POLLUTION INEQUALITIES OF GLOBAL TRADE: A NETWORK AND INPUT-OUTPUT APPROACH"                                                                                                         
    ## [47] "ANALYSIS OF URBAN ENERGY CONSUMPTION IN CARBON METABOLIC PROCESSES AND ITS STRUCTURAL ATTRIBUTES: A CASE STUDY FOR BEIJING"                                                                     
    ## [48] "ENAR: ANR PACKAGE FOR ECOSYSTEM NETWORK ANALYSIS"                                                                                                                                               
    ## [49] "AN OVERVIEW OF TREE-RING WIDTH RECORDS ACROSS THE NORTHERN HEMISPHERE"                                                                                                                          
    ## [50] "CARBON NETWORK EMBODIED IN INTERNATIONAL TRADE: GLOBAL STRUCTURAL EVOLUTION AND ITS POLICY IMPLICATIONS"                                                                                        
    ## [51] "LINKING AGRICULTURAL GHG EMISSIONS TO GLOBAL TRADE NETWORK"                                                                                                                                     
    ## [52] "EVOLUTION OF VIRTUAL WATER METABOLIC NETWORK IN DEVELOPING REGIONS: A CASE STUDY OF GUANGDONG PROVINCE"

QUERY: Metrics
--------------

    io.bdf[q.met, c("TI")]

    ##   [1] "HISTORICAL GLOBAL GRIDDED DEGREE-DAYS: A HIGH-SPATIAL RESOLUTION DATABASE OF CDD AND HDD"                                                                                            
    ##   [2] "CARBON COMMUNITIES AND HOTSPOTS FOR CARBON EMISSIONS REDUCTION IN CHINA"                                                                                                             
    ##   [3] "DOES THE STRUCTURE OF INTERSECTORAL EMBEDDED CARBON FLOW NETWORK MATTER TO CARBON REDUCTION IN CHINA?"                                                                               
    ##   [4] "THE ORIGIN AND PROPAGATION OF THE ANTARCTIC CENTENNIAL OSCILLATION"                                                                                                                  
    ##   [5] "A METRIC FOR QUANTIFYING EL NINO PATTERN DIVERSITY WITH IMPLICATIONS FOR ENSO-MEAN STATE INTERACTION"                                                                                
    ##   [6] "ESTIMATING RAW MATERIAL EQUIVALENTS ON A MACRO-LEVEL: COMPARISON OF MULTI-REGIONAL INPUT-OUTPUT ANALYSIS AND HYBRID LCI-IO"                                                          
    ##   [7] "HOW WELL CAN CMIP5 SIMULATE PRECIPITATION AND ITS CONTROLLING PROCESSES OVER TROPICAL SOUTH AMERICA?"                                                                                
    ##   [8] "THE ASIAN SUMMER MONSOON: AN INTERCOMPARISON OF CMIP5 VS. CMIP3 SIMULATIONS OF THE LATE 20TH CENTURY"                                                                                
    ##   [9] "BEYOND MONEY METRICS: ALTERNATIVE APPROACHES TO CONCEPTUALISING AND ASSESSING ECOSYSTEM SERVICES"                                                                                    
    ##  [10] "DISTRIBUTIONAL IMPACTS OF CLIMATE CHANGE MITIGATION IN INDIAN ELECTRICITY: THE INFLUENCE OF GOVERNANCE"                                                                              
    ##  [11] "RISK-BASED INPUT-OUTPUT ANALYSIS OF INFLUENZA EPIDEMIC CONSEQUENCES ON INTERDEPENDENT WORKFORCE SECTORS"                                                                             
    ##  [12] "THE EL NINO AND SOUTHERN OSCILLATION IN THE HISTORICAL CENTENNIAL INTEGRATIONS OF THE NEW GENERATION OF CLIMATE MODELS"                                                              
    ##  [13] "ANALYSIS OF WATER FOOTPRINT OF A PHOTOBIOREACTOR MICROALGAE BIOFUEL PRODUCTION SYSTEM FROM BLUE, GREEN AND LIFECYCLE PERSPECTIVES"                                                   
    ##  [14] "ANALYZING ENSO TELECONNECTIONS IN CMIP MODELS AS A MEASURE OF MODEL FIDELITY IN SIMULATING PRECIPITATION"                                                                            
    ##  [15] "TOWARDS A TRIPLE BOTTOM-LINE SUSTAINABILITY ASSESSMENT OF THE U.S. CONSTRUCTION INDUSTRY"                                                                                            
    ##  [16] "RISK-BASED INPUT-OUTPUT ANALYSIS OF HURRICANE IMPACTS ON INTERDEPENDENT REGIONAL WORKFORCE SYSTEMS"                                                                                  
    ##  [17] "INCOME-BASED ENVIRONMENTAL RESPONSIBILITY"                                                                                                                                           
    ##  [18] "USING LIFE CYCLE ASSESSMENT TO EVALUATE GREEN AND GREY COMBINED SEWER OVERFLOW CONTROL STRATEGIES"                                                                                   
    ##  [19] "MULTIOBJECTIVE PRIORITIZATION METHODOLOGY AND DECISION SUPPORT SYSTEM FOR EVALUATING INVENTORY ENHANCEMENT STRATEGIES FOR DISRUPTED INTERDEPENDENT SECTORS"                          
    ##  [20] "SHORTCOMINGS IN CLIMATE MODEL SIMULATIONS OF THE ENSO-ATLANTIC HURRICANE TELECONNECTION"                                                                                             
    ##  [21] "A VORTICITY-BASED ANALYSIS OF THE SPATIAL AND TEMPORAL CHARACTERISTICS OF THE BEAUFORT ANTICYCLONE"                                                                                  
    ##  [22] "EQUIVALENCE OF THE REALIZED INPUT AND OUTPUT ORIENTED INDIRECT EFFECTS METRICS IN ECOLOGICAL NETWORK ANALYSIS"                                                                       
    ##  [23] "INVENTORY DEVELOPMENT AND INPUT-OUTPUT MODEL OF US LAND USE: RELATING LAND IN PRODUCTION TO CONSUMPTION"                                                                             
    ##  [24] "APPLYING THE STIRPAT MODEL IN A POST-FORDIST LANDSCAPE: CAN A TRADITIONAL ECONOMETRIC MODEL WORK AT THE LOCAL LEVEL?"                                                                
    ##  [25] "THE VERTICAL STRUCTURES OF ATMOSPHERIC TEMPERATURE ANOMALIES ASSOCIATED WITH TWO FLAVORS OF EL NINO SIMULATED BY AMIP II MODELS"                                                     
    ##  [26] "EMERGY ANALYSIS USING US ECONOMIC INPUT-OUTPUT MODELS WITH APPLICATIONS TO LIFE CYCLES OF GASOLINE AND CORN ETHANOL"                                                                 
    ##  [27] "TWENTIETH CENTURY SAHEL RAINFALL VARIABILITY AS SIMULATED BY THE ARPEGE AGCM, AND FUTURE CHANGES"                                                                                    
    ##  [28] "NORTH AMERICAN TEMPERATURE, SNOWFALL, AND SNOW-DEPTH RESPONSE TO WINTER CLIMATE MODES"                                                                                               
    ##  [29] "GREENHOUSE GAS EMISSIONS IN HAWAI'I: HOUSEHOLD AND VISITOR EXPENDITURE ANALYSIS"                                                                                                     
    ##  [30] "SOLUTIONS TO STRATEGIC SUPPLY CHAIN MAPPING ISSUES"                                                                                                                                  
    ##  [31] "1,3-PROPANEDIOL FROM FOSSILS VERSUS BIOMASS: A LIFE CYCLE EVALUATION OF EMISSIONS AND ECOLOGICAL RESOURCES"                                                                          
    ##  [32] "AN EVALUATION OF REPRODUCIBILITY OF THE PACIFIC DECADAL OSCILLATION IN THE CMIP3 SIMULATIONS"                                                                                        
    ##  [33] "EVALUATION FOR THE SEASONAL EVOLUTION OF THE SUMMER MONSOON OVER THE ASIAN AND WESTERN NORTH PACIFIC SECTOR IN THE WCRP CMIP3 MULTI-MODEL EXPERIMENTS"                               
    ##  [34] "ANALYSIS ON THE DYNAMICS OF A WAVE-LIKE TELECONNECTION PATTERN ALONG THE SUMMERTIME ASIAN JET BASED ON A REANALYSIS DATASET AND CLIMATE MODEL SIMULATIONS"                           
    ##  [35] "ECOLOGICAL INPUT-OUTPUT ANALYSIS-BASED SUSTAINABILITY ANALYSIS OF INDUSTRIAL SYSTEMS"                                                                                                
    ##  [36] "MEASURING MATERIAL CYCLING IN INDUSTRIAL SYSTEMS"                                                                                                                                    
    ##  [37] "COMPARISON OF 700-HPA NCEP-R1 AND AMIP-R2 WIND PATTERNS OVER THE CONTINENTAL UNITED STATES USING CLUSTER ANALYSIS"                                                                   
    ##  [38] "REDUCED ATMOSPHERIC MODELS USING DYNAMICALLY MOTIVATED BASIS FUNCTIONS"                                                                                                              
    ##  [39] "A FRAMEWORK FOR LINKING CYBERSECURITY METRICS TO THE MODELING OF MACROECONOMIC INTERDEPENDENCIES"                                                                                    
    ##  [40] "INDUSTRIAL AND ECOLOGICAL CUMULATIVE EXERGY CONSUMPTION OF THE UNITED STATES VIA THE 1997 INPUT-OUTPUT BENCHMARK MODEL"                                                              
    ##  [41] "FLOW OF NATURAL VERSUS ECONOMIC CAPITAL IN INDUSTRIAL SUPPLY NETWORKS AND ITS IMPLICATIONS TO SUSTAINABILITY"                                                                        
    ##  [42] "HIERARCHICAL THERMODYNAMIC METRICS FOR EVALUATING THE ENVIRONMENTAL SUSTAINABILITY OF INDUSTRIAL PROCESSES"                                                                          
    ##  [43] "THERMODYNAMIC ACCOUNTING OF ECOSYSTEM CONTRIBUTION TO ECONOMIC SECTORS WITH APPLICATION TO 1992 US ECONOMY"                                                                          
    ##  [44] "ENVIRONMENTAL DEGRADATION AND REMEDIATION: IS ECONOMICS PART OF THE PROBLEM?"                                                                                                        
    ##  [45] "A HIERARCHIC METRIC APPROACH FOR INTEGRATION OF GREEN ISSUES IN MANUFACTURING: A PAPER RECYCLING APPLICATION"                                                                        
    ##  [46] "ENVIRONMENTAL IMPLICATIONS OF SERVICE INDUSTRIES"                                                                                                                                    
    ##  [47] "INPUT-OUTPUT-ANALYSIS OF ENERGY-REQUIREMENTS FOR SHORT ROTATION, INTENSIVE CULTURE, WOODY BIOMASS"                                                                                   
    ##  [48] "ASSESSING REGIONAL AND GLOBAL ENVIRONMENTAL FOOTPRINTS AND VALUE ADDED OF THE LARGEST FOOD PRODUCERS IN THE WORLD"                                                                   
    ##  [49] "THE RAW MATERIAL BASIS OF GLOBAL VALUE CHAINS: ALLOCATING ENVIRONMENTAL RESPONSIBILITY BASED ON VALUE GENERATION"                                                                    
    ##  [50] "VALUING OUR NATIONAL PARKS: AN ECOLOGICAL ECONOMICS PERSPECTIVE"                                                                                                                     
    ##  [51] "IMPACTS OF ONSET TIME OF EL NINO EVENTS ON SUMMER RAINFALL OVER SOUTHEASTERN AUSTRALIA DURING 1980-2017"                                                                             
    ##  [52] "A METHOD FOR ECONOMIC INPUT-OUTPUT SOCIAL IMPACT ANALYSIS WITH APPLICATION TO US ADVANCED MANUFACTURING"                                                                             
    ##  [53] "OBSERVED AND SIMULATED TELECONNECTIONS BETWEEN THE STRATOSPHERIC QUASI-BIENNIAL OSCILLATION AND NORTHERN HEMISPHERE WINTER ATMOSPHERIC CIRCULATION"                                  
    ##  [54] "INDICATORS AND TRENDS OF POLAR COLD AIRMASS"                                                                                                                                         
    ##  [55] "OUTSOURCING NATURAL RESOURCE REQUIREMENTS WITHIN CHINA"                                                                                                                              
    ##  [56] "MATHEMATICS FOR SCENARIOS OF BIODIVERSITY AND ECOSYSTEM SERVICES"                                                                                                                    
    ##  [57] "NEXUS STRENGTH: A NOVEL METRIC FOR ASSESSING THE GLOBAL RESOURCE NEXUS"                                                                                                              
    ##  [58] "CLIMATIC AND VOLCANIC FORCING OF TROPICAL BELT NORTHERN BOUNDARY OVER THE PAST 800 YEARS"                                                                                            
    ##  [59] "THE LINKAGE BETWEEN ARCTIC SEA ICE AND MIDLATITUDE WEATHER: IN THE PERSPECTIVE OF ENERGY"                                                                                            
    ##  [60] "TRACING NATURAL RESOURCE USES VIA CHINA'S SUPPLY CHAINS"                                                                                                                             
    ##  [61] "ELECTRICITY GENERATION TECHNOLOGIES: COMPARISON OF MATERIALS USE, ENERGY RETURN ON INVESTMENT, JOBS CREATION AND CO2 EMISSIONS REDUCTION"                                            
    ##  [62] "PACIFIC SEA SURFACE TEMPERATURE RELATED INFLUENCES ON NORTH AMERICAN MONSOON PRECIPITATION WITHIN NORTH AMERICAN REGIONAL CLIMATE CHANGE ASSESSMENT PROGRAM MODELS"                  
    ##  [63] "THE EVOLUTION OF SUSTAINABILITY MEASUREMENT RESEARCH"                                                                                                                                
    ##  [64] "CARBON EMISSIONS PINCH ANALYSIS OF ECONOMIC SYSTEMS"                                                                                                                                 
    ##  [65] "MODELLING MULTI-REGIONAL ECOLOGICAL EXCHANGES: THE CASE OF UK AND AFRICA"                                                                                                            
    ##  [66] "INTERPROVINCIAL TRANSFER OF EMBODIED PRIMARY ENERGY IN CHINA: A COMPLEX NETWORK APPROACH"                                                                                            
    ##  [67] "ON THE LIKELIHOOD OF TROPICAL-EXTRATROPICAL CLOUD BANDS IN THE SOUTH INDIAN CONVERGENCE ZONE DURING ENSO EVENTS"                                                                     
    ##  [68] "ANALYSIS OF RAINFALL TRENDS OVER INDO-PAKISTAN SUMMER MONSOON AND RELATED DYNAMICS BASED ON CMIP5 CLIMATE MODEL SIMULATIONS"                                                         
    ##  [69] "EMBODIED CARBON AS A PROXY FOR THE ENVIRONMENTAL IMPACT OF EARTHQUAKE DAMAGE REPAIR"                                                                                                 
    ##  [70] "IDENTIFICATION OF THE CRITICAL TRANSMISSION SECTORS AND TYPOLOGY OF INDUSTRIAL WATER USE FOR SUPPLY-CHAIN WATER PRESSURE MITIGATION"                                                 
    ##  [71] "SOCIAL LIFE CYCLE ASSESSMENT OF FIRST AND SECOND-GENERATION ETHANOL PRODUCTION TECHNOLOGIES IN BRAZIL"                                                                               
    ##  [72] "THE WATER-ENERGY-FOOD NEXUS IN EAST ASIA: A TELE-CONNECTED VALUE CHAIN ANALYSIS USING INTER-REGIONAL INPUT-OUTPUT ANALYSIS"                                                          
    ##  [73] "21ST CENTURY CALIFORNIA DROUGHT RISK LINKED TO MODEL FIDELITY OF THE EL NINO TELECONNECTION"                                                                                         
    ##  [74] "A MULTI-REGION INPUT-OUTPUT MODEL FOR OPTIMIZING VIRTUAL WATER TRADE FLOWS IN AGRICULTURAL CROP PRODUCTION"                                                                          
    ##  [75] "AN INPUT-OUTPUT BASED NET-ENERGY ASSESSMENT OF AN ELECTRICITY SUPPLY INDUSTRY"                                                                                                       
    ##  [76] "PRODUCTION AND CONSUMPTION-BASED WATER DYNAMICS: A LONGITUDINAL ANALYSIS FOR THE EU27"                                                                                               
    ##  [77] "THERMODYNAMIC INSIGHTS AND ASSESSMENT OF THE `CIRCULAR ECONOMY'"                                                                                                                     
    ##  [78] "NETWORK ANALYSIS OF INTER-SECTORAL RELATIONSHIPS AND KEY SECTORS IN THE GREEK ECONOMY"                                                                                               
    ##  [79] "URBAN ENERGY-WATER NEXUS BASED ON MODIFIED INPUT-OUTPUT ANALYSIS"                                                                                                                    
    ##  [80] "INPUT-OUTPUT ANALYSIS OF INTERNATIONAL RESEARCH COLLABORATIONS: A CASE STUDY OF FIVE US UNIVERSITIES"                                                                                
    ##  [81] "AN ASSESSMENT OF INDIAN MONSOON SEASONAL FORECASTS AND MECHANISMS UNDERLYING MONSOON INTERANNUAL VARIABILITY IN THE MET OFFICE GLOSEA5-GC2 SYSTEM"                                   
    ##  [82] "LOSS AND BENEFIT CAUSED BY A DIESEL ENGINE FROM THE PERSPECTIVE OF HUMAN HEALTH"                                                                                                     
    ##  [83] "CARBON FOOTPRINT STOCK ANALYSIS OF US MANUFACTURING: A TIME SERIES INPUT-OUTPUT LCA"                                                                                                 
    ##  [84] "THE VIRTUAL IELAB - AN EXERCISE IN REPLICATING PART OF THE EXIOBASE V.2 PRODUCTION PIPELINE IN A VIRTUAL LABORATORY"                                                                 
    ##  [85] "REGIONAL DISTRIBUTION AND LOSSES OF END-OF-LIFE STEEL THROUGHOUT MULTIPLE PRODUCT LIFE CYCLES INSIGHTS FROM THE GLOBAL MULTIREGIONAL MATRACE MODEL"                                  
    ##  [86] "RECENT CLIMATOLOGICAL TRENDS AND POTENTIAL INFLUENCES ON FOREST PHENOLOGY AROUND WESTERN LAKE SUPERIOR, USA"                                                                         
    ##  [87] "A FUZZY DATA ENVELOPMENT ANALYSIS FRAMEWORK FOR DEALING WITH UNCERTAINTY IMPACTS OF INPUT-OUTPUT LIFE CYCLE ASSESSMENT MODELS ON ECO-EFFICIENCY ASSESSMENT"                          
    ##  [88] "SIMPLE METRICS FOR REPRESENTING EAST ASIAN WINTER MONSOON VARIABILITY: URALS BLOCKING AND WESTERN PACIFIC TELECONNECTION PATTERNS"                                                   
    ##  [89] "TRACKING INTER-REGIONAL CARBON FLOWS: A HYBRID NETWORK MODEL"                                                                                                                        
    ##  [90] "ESTIMATION OF ECONOMIC IMPACTS OF CELLULOSIC BIOFUEL PRODUCTION: A COMPARATIVE ANALYSIS OF THREE BIOFUEL PATHWAYS"                                                                   
    ##  [91] "INTEGRATING EXPERT WEIGHTING AND MULTI-CRITERIA DECISION MAKING INTO ECO-EFFICIENCY ANALYSIS: THE CASE OF US MANUFACTURING"                                                          
    ##  [92] "AN INTEGRATED MODEL FOR MARINE FISHERY MANAGEMENT IN THE PEARL RIVER ESTUARY: LINKING SOCIO-ECONOMIC SYSTEMS AND ECOSYSTEMS"                                                         
    ##  [93] "INPUT-OUTPUT LIFE CYCLE ENVIRONMENTAL ASSESSMENT OF GREENHOUSE GAS EMISSIONS FROM UTILITY SCALE WIND ENERGY IN THE UNITED STATES"                                                    
    ##  [94] "NEW PERSPECTIVES ON THE COLLECTIVE RISK OF EXTRATROPICAL CYCLONES"                                                                                                                   
    ##  [95] "ACCOUNTING FOR HIDDEN ENERGY DEPENDENCY: THE IMPACT OF ENERGY EMBODIED IN TRADED GOODS ON CROSS-COUNTRY ENERGY SECURITY ASSESSMENTS"                                                 
    ##  [96] "RISK ASSESSMENT OF THE ECONOMIC IMPACTS OF CLIMATE CHANGE ON THE IMPLEMENTATION OF MANDATORY BIODIESEL BLENDING PROGRAMS: A FUZZY INOPERABILITY INPUT-OUTPUT MODELING (IIM) APPROACH"
    ##  [97] "COST-EFFECTIVE ECOLOGICAL RESTORATION"                                                                                                                                               
    ##  [98] "FLOW DISTANCES ON OPEN FLOW NETWORKS"                                                                                                                                                
    ##  [99] "THE NORTH PACIFIC-DRIVEN SEVERE MIDWEST WINTER OF 2013/14"                                                                                                                           
    ## [100] "SKILL OF CMIP5 CLIMATE MODELS IN REPRODUCING 20TH CENTURY BASIC CLIMATE FEATURES IN CENTRAL AMERICA"                                                                                 
    ## [101] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"                                                                                
    ## [102] "A NETWORK OF NETWORKS PERSPECTIVE ON GLOBAL TRADE"                                                                                                                                   
    ## [103] "THE FOOTPRINT OF USING METALS: NEW METRICS OF CONSUMPTION AND PRODUCTIVITY"                                                                                                          
    ## [104] "THE PRICE OF SNOW: ALBEDO VALUATION AND A CASE STUDY FOR FOREST MANAGEMENT"                                                                                                          
    ## [105] "LABOR EMBODIED IN TRADE: THE ROLE OF LABOR AND ENERGY PRODUCTIVITY AND IMPLICATIONS FOR GREENHOUSE GAS EMISSIONS"                                                                    
    ## [106] "A STOCHASTIC RECOVERY MODEL OF INFLUENZA PANDEMIC EFFECTS ON INTERDEPENDENT WORKFORCE SYSTEMS"                                                                                       
    ## [107] "TOWARDS LIFE CYCLE SUSTAINABILITY ASSESSMENT OF ALTERNATIVE PASSENGER VEHICLES"                                                                                                      
    ## [108] "ECO-EFFICIENCY BASED ON SOCIAL PERFORMANCE AND ITS RELATIONSHIP WITH FINANCIAL PERFORMANCE A CROSS-INDUSTRY ANALYSIS OF SOUTH KOREA"                                                 
    ## [109] "SUSTAINABILITY ASSESSMENT OF U.S. FINAL CONSUMPTION AND INVESTMENTS: TRIPLE-BOTTOM-LINE INPUT-OUTPUT ANALYSIS"                                                                       
    ## [110] "QUANTITATIVE ACCOUNTING FOR SOCIAL ECONOMIC INDICATORS"                                                                                                                              
    ## [111] "STOCHASTIC DECISION MODELING FOR SUSTAINABLE PAVEMENT DESIGNS"                                                                                                                       
    ## [112] "WILL ECONOMIC RESTRUCTURING IN CHINA REDUCE TRADE-EMBODIED CO2 EMISSIONS?"                                                                                                           
    ## [113] "MODELING UNCERTAINTIES IN WORKFORCE DISRUPTIONS FROM INFLUENZA PANDEMICS USING DYNAMIC INPUT-OUTPUT ANALYSIS"                                                                        
    ## [114] "GAUGING THE PERFORMANCE OF CMIP5 HISTORICAL SIMULATION IN REPRODUCING OBSERVED GAUGE RAINFALL OVER KENYA"                                                                            
    ## [115] "SETTING BETTER-INFORMED CLIMATE TARGETS FOR NEW ZEALAND: THE INFLUENCE OF VALUE AND MODELING CHOICES"                                                                                
    ## [116] "WEST PACIFIC TELECONNECTION PATTERN IN DYNAMICAL SEASONAL PREDICTIONS: HOW IS IT CONNECTED TO THE ATLANTIC ATMOSPHERIC MEAN BIAS?"                                                   
    ## [117] "IMPROVED HISTORICAL SIMULATION BY ENHANCING MOIST PHYSICAL PARAMETERIZATIONS IN THE CLIMATE SYSTEM MODEL NESM3.0"                                                                    
    ## [118] "OUTSOURCING, TRADE, TECHNOLOGY, AND GREENHOUSE GAS EMISSIONS"                                                                                                                        
    ## [119] "DIAGNOSTIC METRICS FOR EVALUATING MODEL SIMULATIONS OF THE EAST ASIAN MONSOON"                                                                                                       
    ## [120] "UNDERSTANDING THE SEASONAL VARIATIONS OF PENINSULAR FLORIDA"                                                                                                                         
    ## [121] "WHY RARE TROPICAL CYCLONE FORMATION AFTER MATURITY OF SUPER EL NINO EVENTS IN THE WESTERN NORTH PACIFIC?"                                                                            
    ## [122] "MJO TELECONNECTIONS OVER THE PNA REGION IN CLIMATE MODELS. PART I: PERFORMANCE- AND PROCESS-BASED SKILL METRICS"                                                                     
    ## [123] "CARBON FOOTPRINT OF JAPANESE HEALTH CARE SERVICES FROM 2011 TO 2015"                                                                                                                 
    ## [124] "LIFE CYCLE SUSTAINABILITY ASSESSMENT OF AUTONOMOUS HEAVY-DUTY TRUCKS"                                                                                                                
    ## [125] "WILDFIRE BURNT AREA PATTERNS AND TRENDS IN WESTERN MEDITERRANEAN EUROPE VIA THE APPLICATION OF A CONCENTRATION INDEX"                                                                
    ## [126] "THE CIRCULARITY GAP OF NATIONS: A MULTIREGIONAL ANALYSIS OF WASTE GENERATION, RECOVERY, AND STOCK DEPLETION IN 2011"                                                                 
    ## [127] "ASSESSMENT OF CLIMATE IMPACT ON VEGETATION DYNAMICS OVER EAST AFRICA FROM 1982 TO 2015"

    io.bdf[q.met & q.land, c("TI")]

    ## [1] "INVENTORY DEVELOPMENT AND INPUT-OUTPUT MODEL OF US LAND USE: RELATING LAND IN PRODUCTION TO CONSUMPTION"             
    ## [2] "APPLYING THE STIRPAT MODEL IN A POST-FORDIST LANDSCAPE: CAN A TRADITIONAL ECONOMETRIC MODEL WORK AT THE LOCAL LEVEL?"
    ## [3] "MODELLING MULTI-REGIONAL ECOLOGICAL EXCHANGES: THE CASE OF UK AND AFRICA"                                            
    ## [4] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"

QUERY: Resilience
-----------------

    io.bdf[q.res, c("TI")]

    ##  [1] "ENERGY-ECONOMIC RESILIENCE WITH MULTI-REGION INPUT-OUTPUT LINEAR PROGRAMMING MODELS"                                                                                        
    ##  [2] "OVERCOMING THE PROCESS-STRUCTURE DIVIDE IN CONCEPTIONS OF SOCIAL-ECOLOGICAL TRANSFORMATION ASSESSING THE TRANSFORMATIVE CHARACTER AND IMPACT OF CHANGE PROCESSES"           
    ##  [3] "MULTI-CRITERIA DECISION-MAKING FOR SEISMIC RESILIENCE AND SUSTAINABILITY ASSESSMENT OF DIAGRID BUILDINGS"                                                                   
    ##  [4] "ESTIMATING THE ECONOMIC CONSEQUENCES OF A PORT SHUTDOWN: THE SPECIAL ROLE OF RESILIENCE"                                                                                    
    ##  [5] "RISK-BASED INPUT-OUTPUT ANALYSIS OF HURRICANE IMPACTS ON INTERDEPENDENT REGIONAL WORKFORCE SYSTEMS"                                                                         
    ##  [6] "CAN ECONOMIC, LAND USE AND CLIMATIC STRESSES LEAD TO FAMINE, DISEASE, WARFARE AND DEATH? USING EUROPE'S CALAMITOUS 14TH CENTURY AS A PARABLE FOR THE MODERN AGE"            
    ##  [7] "RESILIENCE IN LANDSCAPE EXPLOITATION SYSTEMS"                                                                                                                               
    ##  [8] "SUSTAINABILITY BEGINS AT HOME? AN ECOLOGICAL EXPLORATION OF SUB/URBAN AUSTRALIAN COMMUNITY-FOCUSED HOUSING INITIATIVES"                                                     
    ##  [9] "DEVELOPMENT OF A FRAMEWORK FOR SUSTAINABLE USES OF RESOURCES: MORE PAPER AND LESS PLASTICS?"                                                                                
    ## [10] "MANAGING ECOSYSTEM SERVICES: WHAT DO WE NEED TO KNOW ABOUT THEIR ECOLOGY?"                                                                                                  
    ## [11] "UNCERTAINTY AND THE MANAGEMENT OF MULTISTATE ECOSYSTEMS: AN APPARENTLY RATIONAL ROUTE TO COLLAPSE"                                                                          
    ## [12] "ECOLOGICAL FUTURES: BUILDING AN ECOLOGY OF THE LONG NOW"                                                                                                                    
    ## [13] "ECONOMICS, ENTROPY AND THE LONG TERM FUTURE: CONCEPTUAL FOUNDATIONS AND THE PERSPECTIVE OF THE ECONOMICS OF SURVIVAL"                                                       
    ## [14] "ANALYSING ECONOMIC IMPACT ON INTERDEPENDENT INFRASTRUCTURE AFTER FLOOD: PAKISTAN A CASE IN POINT"                                                                           
    ## [15] "ADAPTIVE POLICY FRAMEWORK THROUGH THE LENS OF THE VIABILITY THEORY: A THEORETICAL CONTRIBUTION TO SUSTAINABILITY IN THE ANTHROPOCENE ERA"                                   
    ## [16] "SMALLHOLDER TELECOUPLING AND POTENTIAL SUSTAINABILITY"                                                                                                                      
    ## [17] "ECONOMIC CRISIS AND REGIONAL RESILIENCE: EVIDENCE FROM GREECE"                                                                                                              
    ## [18] "CATCHMENT METABOLISM: INTEGRATING NATURAL CAPITAL IN THE ASSET MANAGEMENT PORTFOLIO OF THE WATER SECTOR"                                                                    
    ## [19] "MODELING TELECONNECTED URBAN SOCIAL-ECOLOGICAL SYSTEMS: OPPORTUNITIES AND CHALLENGES FOR RESILIENCE RESEARCH"                                                               
    ## [20] "INOPERABILITY INPUT-OUTPUT MODELING: INVENTORY OPTIMIZATION AND RESILIENCE ESTIMATION DURING CRITICAL EVENTS"                                                               
    ## [21] "LAND-OCEAN INTERACTIONS IN THE COASTAL ZONE: PAST, PRESENT \\& FUTURE"                                                                                                      
    ## [22] "QUANTIFYING THE RELATIONSHIP OF RESILIENCE AND ECO-EFFICIENCY IN COMPLEX ADAPTIVE ENERGY SYSTEMS"                                                                           
    ## [23] "EXAMINING THE RESILIENCE OF NATIONAL ENERGY SYSTEMS: MEASUREMENTS OF DIVERSITY IN PRODUCTION-BASED AND CONSUMPTION-BASED ELECTRICITY IN THE GLOBALIZATION OF TRADE NETWORKS"
    ## [24] "INTERCONNECTEDNESS AND INTERDEPENDENCIES OF CRITICAL INFRASTRUCTURES IN THE US ECONOMY: IMPLICATIONS FOR RESILIENCE"                                                        
    ## [25] "ECONOMIC IMPACT OF PRODUCTION BOTTLENECKS CAUSED BY DISASTERS IMPACTING INTERDEPENDENT INDUSTRY SECTORS"                                                                    
    ## [26] "ENERGY IMPORT RESILIENCE WITH INPUT-OUTPUT LINEAR PROGRAMMING MODELS"                                                                                                       
    ## [27] "QUANTIFYING CASCADING EFFECTS TRIGGERED BY DISRUPTED TRANSPORTATION DUE TO THE GREAT 2008 CHINESE ICE STORM: IMPLICATIONS FOR DISASTER RISK MANAGEMENT"                     
    ## [28] "TOWARD SUSTAINABLE CLIMATE CHANGE ADAPTATION"

Literature Review: Methods and Background
=========================================

    kw <- gsub(";", "", unlist(strsplit(io.bdf[q.land, "DE"], split = "; ")))
    kw <- sapply(kw, rm.spch)
    kw <- unlist(strsplit(kw, " "))
    kw.tab <- table(kw)

<img src="report_files/figure-markdown_strict/art-year-1.png" width="100%" />

<img src="report_files/figure-markdown_strict/kw-treemap-1.png" width="100%" />

<table>
<thead>
<tr class="header">
<th align="left">topic</th>
<th align="right">count</th>
<th align="right">percent</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">IO_MRIO</td>
<td align="right">2297</td>
<td align="right">29.62</td>
</tr>
<tr class="even">
<td align="left">Review</td>
<td align="right">35</td>
<td align="right">0.45</td>
</tr>
<tr class="odd">
<td align="left">Land</td>
<td align="right">63</td>
<td align="right">0.81</td>
</tr>
<tr class="even">
<td align="left">Forest</td>
<td align="right">61</td>
<td align="right">0.79</td>
</tr>
<tr class="odd">
<td align="left">Forest Network</td>
<td align="right">3</td>
<td align="right">0.04</td>
</tr>
<tr class="even">
<td align="left">Land Metrics</td>
<td align="right">4</td>
<td align="right">0.05</td>
</tr>
<tr class="odd">
<td align="left">ENA</td>
<td align="right">35</td>
<td align="right">0.45</td>
</tr>
<tr class="even">
<td align="left">Network</td>
<td align="right">39</td>
<td align="right">0.50</td>
</tr>
<tr class="odd">
<td align="left">CHNS</td>
<td align="right">8</td>
<td align="right">0.10</td>
</tr>
<tr class="even">
<td align="left">Climate Change</td>
<td align="right">68</td>
<td align="right">0.88</td>
</tr>
<tr class="odd">
<td align="left">Resilience</td>
<td align="right">28</td>
<td align="right">0.36</td>
</tr>
<tr class="even">
<td align="left">Metric</td>
<td align="right">55</td>
<td align="right">0.71</td>
</tr>
<tr class="odd">
<td align="left">Total</td>
<td align="right">7755</td>
<td align="right">100.00</td>
</tr>
</tbody>
</table>

    export_query(io.bdf, q.all, dir = "data/wos-mrio_query", overwrite = TRUE)

    ##  [1] "IO_MRIO.csv"        "Review.csv"         "Land.csv"          
    ##  [4] "Forest.csv"         "Forest_Network.csv" "Land_Metrics.csv"  
    ##  [7] "ENA.csv"            "Network.csv"        "CHNS.csv"          
    ## [10] "Climate_Change.csv" "Resilience.csv"     "Metric.csv"        
    ## [1] "Successfully written to data/wos-mrio_query"

    mk_review(io.bdf, q.all[-1], file = "results/wos_review.md", overwrite = TRUE)

<!-- q.all <- list("IO_MRIO" = q.mrio, Land = q.land, Resilience = q.res, -->
<!--              "Climate Change" = q.mc,  -->
<!--              Metric = q.met, Network = q.net, ENA = q.ena, CHNS = q.chns,  -->
<!--              "Land Metrics" = q.met.land, Review = (q.rev | q.ov)) -->
Searched and Reviewed "Land" Query
----------------------------------

-   Searched within queried papers and found papers with MRIO, network
    or resilience
-   Need to add telecoupling and land-system science articles
-   Recompile using a cross-referencing = LAND & MRIO | NETWORK |
    RESILIENCE | SUSTAINABILITY

Review
======

Processing papers compiled in results/wos\_review.md

What reviews are published on the topic of network analysis of landscape extended MRIO?
---------------------------------------------------------------------------------------

We found three published reviews/overviews that examine the indirect
effects of consumption on landscapes. The most recent by
ISI:000435619900021 conducted a global analysis of indirect land
consumption. They found stark disparaties arable land consumption among
countries world-wide. ISI:000363267800003 conducted a review of methods
for accounting for upstream land-use in traded products and focusing on
two major approaches, accounting based approaches and environmentally
extended input-output analyses, to clarify underlying conceptual issues
with accounting for land-use. The third review by ISI:000355026400002
evaluated accounting and evaluation methods used in calculating land
footprints and point to options for further developing footprint
accountting methods, highlighting advantages of hybridizing different
approaches and increasing transparency in assessments.

### Land

-   AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO
    SINK VIA THE GLOBAL SUPPLY CHAIN | WU XD, 2018, LAND USE POL |
    ISI000435619900021

As an extension of a previous work (Chen and Han, 2015a), this study
explored the arable land use of the world economy from source of
exploitation to sink of final consumption via the global supply chain,
by means of embodiment accounting that includes the indirect feedbacks
associated with both intermediate and primary inputs. In magnitude, the
global transfer of arable land use is estimated to be around 40% of the
total direct exploitation. The connections as well as imbalances of
major economies in intermediate and final trades of arable land use are
discussed. Canada, Australia, Argentina, Pakistan and African regions
turn out to have a massive deficit of arable land use in both
intermediate and final trades. In contrast, the United States, Japan,
Mainland China, the United Kingdom, Germany and France obtain a surplus
of arable land use in both intermediate and final trades by land
displacement in those net exporters. Indices in terms of arable land use
self-sufficiency rate by source and that by sink are devised. For India
as the biggest source region, around 20% of the arable land resources
exploited locally are for final consumption abroad. For the United
States as the largest sink region, around 40% of its arable land use
originates from foreign regions led by Canada. For Japan as the biggest
net importer in both intermediate and final trades, over 90% of its
arable land use comes from foreign economies led by African and Asian
regions. For sustained development, regions are suggested to be more
adapted to the global supply chain based on their behaviors in both
intermediate and final trades of arable land use.

-   TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND
    REQUIREMENTS OF TRADED PRODUCTS | SCHAFFARTZIK A, 2015, J IND ECOL |
    ISI000363267800003

Land use is recognized as a pervasive driver of environmental impacts,
including climate change and biodiversity loss. Global trade leads to
telecoupling between the land use of production and the consumption of
biomass-based goods and services. Telecoupling is captured by accounts
of the upstream land requirements associated with traded products, also
commonly referred to as land footprints. These accounts face challenges
in two main areas: (1) the allocation of land to products traded and
consumed and (2) the metrics to account for differences in land quality
and land-use intensity. For two main families of accounting approaches
(biophysical, factor-based and environmentally extended input-output
analysis), this review discusses conceptual differences and compares
results for land footprints. Biophysical approaches are able to capture
a large number of products and different land uses, but suffer from a
truncation problem. Economic approaches solve the truncation problem,
but are hampered by the limited disaggregation of sectors and products.
In light of the conceptual differences, the overall similarity of
results generated by both types of approaches is remarkable.
Diametrically opposed results for some of the world's largest producers
and consumers of biomass-based products, however, make interpretation
difficult. This review aims to provide clarity on some of the underlying
conceptual issues of accounting for land footprints.

-   MEASURING TELECOUPLINGS IN THE GLOBAL LAND SYSTEM: A REVIEW AND
    COMPARATIVE EVALUATION OF LAND FOOTPRINT ACCOUNTING METHODS |
    BRUCKNER M, 2015, ECOL ECON | ISI000355026400002

In an increasingly globalized world with more and more distributed
international supply chains, sustainability studies and policies need to
consider socioeconomic and environmental interactions between distant
places. Studies of the global biomass metabolism investigate physical
flows between and within nature and human systems, thus providing a
useful basis for understanding the interrelatedness of changes in one
place with impacts elsewhere. Various methodological approaches exist
for studying the human-nature metabolism and estimating the land
embodied in international trade flows, a core element of assessing
telecouplings in the global land system. The results of recent studies
vary widely, lacking robustness and thus hampering their application in
policy making. This article provides a structured overview and
comparative evaluation of existing accounting methods and models for
calculating land footprints. We identify differences in available
accounting methods and indicate their shortcomings, which are mainly
attributable to the product and supply chain coverage and detail, and
biases introduced by the use of monetary flows as a proxy for actual
physical flows. We suggest options for further development of global
land footprint accounting methods, particularly highlighting the
advantages of hybrid accounting approaches as a framework for robust and
transparent assessments of the global displacement of land use.

### General consumption

-   METABOLISM AND ENVIRONMENTAL IMPACTS OF HOUSEHOLD CONSUMPTION: A
    REVIEW ON THE ASSESSMENT, METHODOLOGY, AND DRIVERS | DI DONATO M,
    2015, J IND ECOL | ISI000363267800019
-   ENVIRONMENT IMPACTS OF PRODUCTS - A DETAILED REVIEW OF STUDIES |
    TUKKER A, 2006, J IND ECOL | ISI000239378800012
-   REVIEW OF MODELING TECHNIQUES AND TOOLS FOR DECISION-MAKING IN
    MANUFACTURING MANAGEMENT | PANDYA KV, 1995, IEE PROC -SCI MEAS
    TECHNOL | ISIA1995RZ59000006

### Energy consumption

-   ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED
    PERSPECTIVE | WU XD, 2019, ENERGY POLICY-a | ISI000463688200028
-   NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL
    DEMAND VIA GLOBAL SUPPLY CHAINS | KAN SY, 2019, ENERGY POLICY |
    ISI000453642600020
-   GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH
    INTER-REGIONAL TRADE | WU XF, 2019, ENERGY POLICY |
    ISI000463688800046

### Carbon footprint

-   TOWARDS A UNIVERSAL CARBON FOOTPRINT STANDARD: A CASE STUDY OF
    CARBON MANAGEMENT AT UNIVERSITIES | ROBINSON OJ, 2018, J CLEAN PROD
    | ISI000423002500125
-   ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW | LOMBARDI M,
    2017, ENVIRON IMPACT ASSESS REV | ISI000410870300005
-   HOUSEHOLD CARBON EMISSION RESEARCH: AN ANALYTICAL REVIEW OF
    MEASUREMENT, INFLUENCING FACTORS AND MITIGATION PROSPECTS | ZHANG X,
    2015, J CLEAN PROD | ISI000356990800085
-   INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF
    APPLICATIONS | MINX JC, 2009, ECON SYST RES | ISI000275698000002
-   ENERGY AND CO2 LIFE-CYCLE ANALYSES OF WIND TURBINES - REVIEW AND
    APPLICATIONS | LENZEN M, 2002, RENEW ENERGY | ISI000174693500002

### Water footprint

-   GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE
    WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL
    CONSUMPTION | WU XD, 2019, J HYDROL | ISI000474327800063

References
==========
