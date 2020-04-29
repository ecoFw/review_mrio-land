







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
-   What has been done?
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
-   What are the priorities?
-   Climate change
-   Land-use change
-   Structural analyses
    -   Targets
    -   Metrics
-   Comparison of network and non-network metrics

Outline
=======

-   Resilience metrics for networks of embodied landscapes
-   Landscape context
-   Disturbances
-   Conversion
-   What is resilience?
-   Ecology and resilience
-   Complex systems resilience
    -   MacArthur
    -   May
    -   Ulanowicz
    -   Sheffer
-   Environmental embodied trade networks
-   IO background
-   Environmental/Social
-   Landscapes
-   Network metrics and resilience
-   FATH
-   Bascompte
-   Ulanowicz
-   Review methods and overview
-   Review: Metrics
-   IO -&gt; MRIO -&gt; EEMRIO
-   LEMRIO
-   IO overlap with ENA
-   ENA(IO) + ENA(LEMRIO)
-   Needs and Directions
-   Climate change
-   Disturbance

Analyses
========

-   What work has been done on landscape mrio?
-   What work has addressed resilience and stability?
-   What ENA metrics have been or could be applied?

<!-- -->

    loadd(io.bdf)

keyword+title: mrio & landscape
-------------------------------

    q.ml <- grepl("^LAND", io.bdf[, "DE"]) | 
        grepl("^LAND", io.bdf[, "TI"]) | 
        grepl(" LAND", io.bdf[, "DE"]) | 
        grepl(" LAND", io.bdf[, "TI"]) 

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
    q.met.land <- q.met & q.ml

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

Reviews/Overviews
-----------------

    io.bdf[q.rev | q.ov, c("TI")]

    ##  [1] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                  
    ##  [2] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                 
    ##  [3] "TOWARDS A UNIVERSAL CARBON FOOTPRINT STANDARD: A CASE STUDY OF CARBON MANAGEMENT AT UNIVERSITIES"                                                                      
    ##  [4] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                     
    ##  [5] "TOURISM AND ECONOMIC GROWTH: A REVIEW OF INTERNATIONAL LITERATURE"                                                                                                     
    ##  [6] "METABOLISM AND ENVIRONMENTAL IMPACTS OF HOUSEHOLD CONSUMPTION: A REVIEW ON THE ASSESSMENT, METHODOLOGY, AND DRIVERS"                                                   
    ##  [7] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"                                                                  
    ##  [8] "HOUSEHOLD CARBON EMISSION RESEARCH: AN ANALYTICAL REVIEW OF MEASUREMENT, INFLUENCING FACTORS AND MITIGATION PROSPECTS"                                                 
    ##  [9] "MEASURING TELECOUPLINGS IN THE GLOBAL LAND SYSTEM: A REVIEW AND COMPARATIVE EVALUATION OF LAND FOOTPRINT ACCOUNTING METHODS"                                           
    ## [10] "A REVIEW OF THE MODELLING OF WATER VALUES IN DIFFERENT USE SECTORS IN SOUTH AFRICA"                                                                                    
    ## [11] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                            
    ## [12] "ENVIRONMENT IMPACTS OF PRODUCTS - A DETAILED REVIEW OF STUDIES"                                                                                                        
    ## [13] "A REVIEW OF DIFFERING APPROACHES USED TO ESTIMATE THE COST OF CORROSION (AND THEIR RELEVANCE IN THE DEVELOPMENT OF MODERN CORROSION PREVENTION AND CONTROL STRATEGIES)"
    ## [14] "ENERGY AND CO2 LIFE-CYCLE ANALYSES OF WIND TURBINES - REVIEW AND APPLICATIONS"                                                                                         
    ## [15] "REVIEW OF MODELING TECHNIQUES AND TOOLS FOR DECISION-MAKING IN MANUFACTURING MANAGEMENT"                                                                               
    ## [16] "EMPLOYMENT AND FARMERS' WORK IN EUROPEAN RUMINANT LIVESTOCK FARMS: A REVIEW"                                                                                           
    ## [17] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                
    ## [18] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                    
    ## [19] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"

ENA/Network
-----------

    io.bdf[q.ena | q.ov, c("TI")]

    ##  [1] "ENERGY WATER NEXUS UNDER ENERGY MIX SCENARIOS USING INPUT OUTPUT AND ECOLOGICAL NETWORK ANALYSES"                                                                         
    ##  [2] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                     
    ##  [3] "ECOLOGICAL NETWORK ANALYSIS FOR AN INDUSTRIAL SOLID WASTE METABOLISM SYSTEM"                                                                                              
    ##  [4] "ECOLOGICAL AND ECONOMIC ANALYSES OF THE FOREST METABOLISM SYSTEM: A CASE STUDY OF GUANGDONG PROVINCE, CHINA"                                                              
    ##  [5] "ECOLOGICAL NETWORK ANALYSIS ON INTRA-CITY METABOLISM OF FUNCTIONAL URBAN AREAS IN ENGLAND AND WALES"                                                                      
    ##  [6] "INTERREGIONAL CARBON FLOWS OF CHINA"                                                                                                                                      
    ##  [7] "MULTIREGIONAL INPUT-OUTPUT AND ECOLOGICAL NETWORK ANALYSES FOR REGIONAL ENERGY-WATER NEXUS WITHIN CHINA"                                                                  
    ##  [8] "ECOLOGICAL NETWORK ANALYSIS FOR URBAN METABOLISM AND CARBON EMISSIONS BASED ON INPUT-OUTPUT TABLES: A CASE STUDY OF GUANGDONG PROVINCE"                                   
    ##  [9] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                    
    ## [10] "PROVINCIAL CARBON EMISSIONS REDUCTION ALLOCATION PLAN IN CHINA BASED ON CONSUMPTION PERSPECTIVE"                                                                          
    ## [11] "INTERREGIONAL TRADE AMONG REGIONS OF URBAN ENERGY METABOLISM: A CASE STUDY BETWEEN BEIJING-TIANJIN-HEBEI AND OTHERS IN CHINA"                                             
    ## [12] "MULTI-SCALE ANALYSIS OF THE ENERGY METABOLIC PROCESSES IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION"                                                    
    ## [13] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                        
    ## [14] "ECOLOGICAL UTILITY THEORY: SOLVING A SERIES CONVERGENCE ISSUE"                                                                                                            
    ## [15] "ENERGY-WATER NEXUS OF INTERNATIONAL ENERGY TRADE OF CHINA"                                                                                                                
    ## [16] "ECOLOGICAL NETWORK ANALYSIS OF ENERGY METABOLISM IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION"                                                          
    ## [17] "HIGHLY VARIABLE MALE COURTSHIP BEHAVIORAL SEQUENCES IN A CRAMBID MOTH"                                                                                                    
    ## [18] "ECOLOGICAL NETWORK ANALYSIS OF EMBODIED PARTICULATE MATTER 2.5-A CASE STUDY OF BEIJING"                                                                                   
    ## [19] "SIX GENERAL ECOSYSTEM PROPERTIES ARE MORE INTENSE IN BIOGEOCHEMICAL CYCLING NETWORKS THAN FOOD WEBS"                                                                      
    ## [20] "ENERGY-WATER NEXUS OF URBAN AGGLOMERATION BASED ON MULTIREGIONAL INPUT-OUTPUT TABLES AND ECOLOGICAL NETWORK ANALYSIS: A CASE STUDY OF THE BEIJING-TIANJIN-HEBEI REGION"   
    ## [21] "ECOLOGICAL NETWORK ANALYSIS OF EMBODIED ENERGY EXCHANGES AMONG THE SEVEN REGIONS OF CHINA"                                                                                
    ## [22] "ECOLOGICAL NETWORK ANALYSIS OF THE VIRTUAL WATER NETWORK WITHIN CHINA'S ELECTRIC POWER SYSTEM DURING 2007-2012"                                                           
    ## [23] "URBAN ENERGY FLOW PROCESSES IN THE BEIJING-TIANJIN-HEBEI (JING-JIN-JI) URBAN AGGLOMERATION: COMBINING MULTI-REGIONAL INPUT-OUTPUT TABLES WITH ECOLOGICAL NETWORK ANALYSIS"
    ## [24] "MULTI-REGIONAL INPUT-OUTPUT MODEL AND ECOLOGICAL NETWORK ANALYSIS FOR REGIONAL EMBODIED ENERGY ACCOUNTING IN CHINA"                                                       
    ## [25] "URBAN ENERGY CONSUMPTION: DIFFERENT INSIGHTS FROM ENERGY FLOW ANALYSIS, INPUT-OUTPUT ANALYSIS AND ECOLOGICAL NETWORK ANALYSIS"                                            
    ## [26] "EQUIVALENCE OF THE REALIZED INPUT AND OUTPUT ORIENTED INDIRECT EFFECTS METRICS IN ECOLOGICAL NETWORK ANALYSIS"                                                            
    ## [27] "THROUGHFLOW ANALYSIS: A STOCHASTIC APPROACH"                                                                                                                              
    ## [28] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                               
    ## [29] "A MATLAB (R) FUNCTION FOR NETWORK ENVIRON ANALYSIS"                                                                                                                       
    ## [30] "UNFOLDING INTERREGIONAL ENERGY FLOW STRUCTURE OF CHINA'S CONSTRUCTION SECTOR BASED ON PROVINCE-LEVEL DATA"                                                                
    ## [31] "CHARACTERISTICS OF TIANJIN'S MATERIAL METABOLISM FROM THE PERSPECTIVE OF ECOLOGICAL NETWORK ANALYSIS"                                                                     
    ## [32] "AN ECOLOGICAL-THERMODYNAMIC APPROACH TO URBAN METABOLISM: MEASURING RESOURCE UTILIZATION WITH OPEN SYSTEM NETWORK EFFECTIVENESS ANALYSIS"                                 
    ## [33] "EVALUATING CHROMIUM COUPLED WITH CARBON METABOLISM AND ENVIRONMENTAL PERFORMANCE IN THE CHROMATE INDUSTRIAL SYMBIOSIS NETWORK IN CHINA"                                   
    ## [34] "ENERGY FOOTPRINT CONTROLLED BY URBAN DEMANDS: HOW MUCH DOES SUPPLY CHAIN COMPLEXITY CONTRIBUTE?"                                                                          
    ## [35] "ECOLOGICAL NETWORK ANALYSIS OF AN ENERGY METABOLISM SYSTEM BASED ON INPUT-OUTPUT TABLES: MODEL DEVELOPMENT AND CASE STUDY FOR GUANGDONG"                                  
    ## [36] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                   
    ## [37] "CHARACTERIZING THE EMBODIED CARBON EMISSIONS FLOWS AND ECOLOGICAL RELATIONSHIPS AMONG FOUR CHINESE MEGACITIES AND OTHER PROVINCES"                                        
    ## [38] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                       
    ## [39] "METABOLISM OF URBAN WASTEWATER: ECOLOGICAL NETWORK ANALYSIS FOR GUANGDONG PROVINCE, CHINA"                                                                                
    ## [40] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"                                                                                                 
    ## [41] "INFORMATION-BASED ECOLOGICAL NETWORK ANALYSIS FOR CARBON EMISSIONS"                                                                                                       
    ## [42] "WATER-LAND NEXUS IN FOOD TRADE BASED ON ECOLOGICAL NETWORK ANALYSIS"

    io.bdf[q.net | q.ov, c("TI")]

    ##  [1] "NATURAL GAS OVERVIEW FOR WORLD ECONOMY: FROM PRIMARY SUPPLY TO FINAL DEMAND VIA GLOBAL SUPPLY CHAINS"                                                                                              
    ##  [2] "DYNAMIC INPUT-OUTPUT ANALYSIS FOR ENERGY METABOLISM SYSTEM IN THE PROVINCE OF GUANGDONG, CHINA"                                                                                                    
    ##  [3] "EVOLUTION OF THE SCIENTIFIC LITERATURE ON INPUT-OUTPUT ANALYSIS: A BIBLIOMETRIC ANALYSIS OF 1990-2017"                                                                                             
    ##  [4] "VISUALIZING THE CHANGE OF EMBODIED CO2 EMISSIONS ALONG GLOBAL PRODUCTION CHAINS"                                                                                                                   
    ##  [5] "A NETWORK ANALYSIS OF INDIRECT CARBON EMISSION FLOWS AMONG DIFFERENT INDUSTRIES IN CHINA"                                                                                                          
    ##  [6] "AN OVERVIEW OF ARABLE LAND USE FOR THE WORLD ECONOMY: FROM SOURCE TO SINK VIA THE GLOBAL SUPPLY CHAIN"                                                                                             
    ##  [7] "SYSTEMIC RISK IN THE GLOBAL WATER INPUT-OUTPUT NETWORK"                                                                                                                                            
    ##  [8] "INDUSTRIAL CHARACTERISTICS AND CONSUMPTION EFFICIENCY FROM A NEXUS PERSPECTIVE - BASED ON ANHUI'S EMPIRICAL STATISTICS"                                                                            
    ##  [9] "AN INQUIRY INTO WATER TRANSFER NETWORK OF THE YANGTZE RIVER ECONOMIC BELT IN CHINA"                                                                                                                
    ## [10] "EMERGY NETWORK ANALYSIS OF CHINESE SECTORAL ECOLOGICAL SUSTAINABILITY"                                                                                                                             
    ## [11] "GLOBAL ENERGY FLOWS EMBODIED IN INTERNATIONAL TRADE: A COMBINATION OF ENVIRONMENTALLY EXTENDED INPUT-OUTPUT ANALYSIS AND COMPLEX NETWORK ANALYSIS"                                                 
    ## [12] "FLOWBCA: A FLOW-BASED CLUSTER ALGORITHM IN STATA"                                                                                                                                                  
    ## [13] "EXAMINING INDUSTRIAL STRUCTURE CHANGES AND CORRESPONDING CARBON EMISSION REDUCTION EFFECT BY COMBINING INPUT-OUTPUT ANALYSIS AND SOCIAL NETWORK ANALYSIS: A COMPARISON STUDY OF CHINA AND JAPAN"   
    ## [14] "ASSESSING THE URBAN CARBON FOOTPRINT: AN OVERVIEW"                                                                                                                                                 
    ## [15] "IDENTIFY SECTORS' ROLE ON THE EMBEDDED CO2 TRANSFER NETWORKS THROUGH CHINA'S REGIONAL TRADE"                                                                                                       
    ## [16] "NETWORK ANALYSIS OF INTER-SECTORAL RELATIONSHIPS AND KEY SECTORS IN THE GREEK ECONOMY"                                                                                                             
    ## [17] "AN URBAN METABOLISM AND CARBON FOOTPRINT ANALYSIS OF THE JING-JIN-JI REGIONAL AGGLOMERATION"                                                                                                       
    ## [18] "AUSTRALIA'S REGIONAL INNOVATION SYSTEMS: INTER-INDUSTRY INTERACTION IN INNOVATIVE ACTIVITIES IN THREE AUSTRALIAN TERRITORIES"                                                                      
    ## [19] "URBAN ENERGY-WATER NEXUS: A NETWORK PERSPECTIVE"                                                                                                                                                   
    ## [20] "UNEQUAL CARBON EXCHANGES THE ENVIRONMENTAL AND ECONOMIC IMPACTS OF ICONIC US CONSUMPTION ITEMS"                                                                                                    
    ## [21] "WEALTH AND POLLUTION INEQUALITIES OF GLOBAL TRADE: A NETWORK AND INPUT-OUTPUT APPROACH"                                                                                                            
    ## [22] "ANALYSIS OF URBAN ENERGY CONSUMPTION IN CARBON METABOLIC PROCESSES AND ITS STRUCTURAL ATTRIBUTES: A CASE STUDY FOR BEIJING"                                                                        
    ## [23] "ECOSYSTEM NETWORK ANALYSIS INDICATORS ARE GENERALLY ROBUST TO PARAMETER UNCERTAINTY IN A PHOSPHORUS MODEL OF LAKE SIDNEY LANIER, USA"                                                              
    ## [24] "APPLYING SOCIAL NETWORK ANALYSIS TO INPUT-OUTPUT BASED INNOVATION MATRICES: AN ILLUSTRATIVE APPLICATION TO SIX OECD TECHNOLOGICAL SYSTEMS FOR THE MIDDLE 1990S"                                    
    ## [25] "INPUT-OUTPUT ANALYSIS AND CARBON FOOTPRINTING: AN OVERVIEW OF APPLICATIONS"                                                                                                                        
    ## [26] "LEAST-INFERENCE METHODS FOR CONSTRUCTING NETWORKS OF TROPHIC FLOWS"                                                                                                                                
    ## [27] "INDIRECT EFFECTS AND DISTRIBUTED CONTROL IN ECOSYSTEMS: TEMPORAL VARIATION OF INDIRECT EFFECTS IN A SEVEN-COMPARTMENT MODEL OF NITROGEN FLOW IN THE NEUSE RIVER ESTUARY, USA- TIME SERIES ANALYSIS"
    ## [28] "THEORY OF MATERIALS AND ENERGY FLOW ANALYSIS IN ECOLOGY AND ECONOMICS"                                                                                                                             
    ## [29] "NETWORK ANALYSIS APPLIED TO LARGE-SCALE CYBER-ECOSYSTEMS"                                                                                                                                          
    ## [30] "NETWORK SYNERGISM: EMERGENCE OF POSITIVE RELATIONS IN ECOLOGICAL SYSTEMS"                                                                                                                          
    ## [31] "CARBON BUDGET AND NETWORK ANALYSIS OF A HIGH-ENERGY BEACH/SURF-ZONE ECOSYSTEM"                                                                                                                     
    ## [32] "LINKING AGRICULTURAL GHG EMISSIONS TO GLOBAL TRADE NETWORK"                                                                                                                                        
    ## [33] "EVOLUTION OF VIRTUAL WATER METABOLIC NETWORK IN DEVELOPING REGIONS: A CASE STUDY OF GUANGDONG PROVINCE"                                                                                            
    ## [34] "CARBON COMMUNITIES AND HOTSPOTS FOR CARBON EMISSIONS REDUCTION IN CHINA"                                                                                                                           
    ## [35] "ENERGY FOOTPRINT PATHWAYS OF CHINA"                                                                                                                                                                
    ## [36] "A STUDY ON EMBODIED CARBON TRANSFER AT THE PROVINCIAL LEVEL OF CHINA FROM A SOCIAL NETWORK PERSPECTIVE"                                                                                            
    ## [37] "LINKAGE ANALYSIS OF TOURISM-RELATED SECTORS IN CHINA: AN ASSESSMENT BASED ON NETWORK ANALYSIS TECHNIQUE"                                                                                           
    ## [38] "ENERGY-INDUCED MERCURY EMISSIONS IN GLOBAL SUPPLY CHAIN NETWORKS: STRUCTURAL CHARACTERISTICS AND POLICY IMPLICATIONS"                                                                              
    ## [39] "GLOBAL SOCIO-HYDROLOGY: AN OVERVIEW OF VIRTUAL WATER USE BY THE WORLD ECONOMY FROM SOURCE OF EXPLOITATION TO SINK OF FINAL CONSUMPTION"                                                            
    ## [40] "GLOBAL OVERVIEW OF CRUDE OIL USE: FROM SOURCE TO SINK THROUGH INTER-REGIONAL TRADE"                                                                                                                
    ## [41] "ENERGY USE IN WORLD ECONOMY FROM HOUSEHOLD-CONSUMPTION-BASED PERSPECTIVE"                                                                                                                          
    ## [42] "NETWORK ANALYSIS OF DIFFERENT TYPES OF FOOD FLOWS: ESTABLISHING THE INTERACTION BETWEEN FOOD FLOWS AND ECONOMIC FLOWS"

Metrics
-------

    io.bdf[q.met, c("TI")]

    ##  [1] "OUTSOURCING NATURAL RESOURCE REQUIREMENTS WITHIN CHINA"                                                                                                                              
    ##  [2] "NEXUS STRENGTH: A NOVEL METRIC FOR ASSESSING THE GLOBAL RESOURCE NEXUS"                                                                                                              
    ##  [3] "TRACING NATURAL RESOURCE USES VIA CHINA'S SUPPLY CHAINS"                                                                                                                             
    ##  [4] "ELECTRICITY GENERATION TECHNOLOGIES: COMPARISON OF MATERIALS USE, ENERGY RETURN ON INVESTMENT, JOBS CREATION AND CO2 EMISSIONS REDUCTION"                                            
    ##  [5] "THE EVOLUTION OF SUSTAINABILITY MEASUREMENT RESEARCH"                                                                                                                                
    ##  [6] "CARBON EMISSIONS PINCH ANALYSIS OF ECONOMIC SYSTEMS"                                                                                                                                 
    ##  [7] "MODELLING MULTI-REGIONAL ECOLOGICAL EXCHANGES: THE CASE OF UK AND AFRICA"                                                                                                            
    ##  [8] "INTERPROVINCIAL TRANSFER OF EMBODIED PRIMARY ENERGY IN CHINA: A COMPLEX NETWORK APPROACH"                                                                                            
    ##  [9] "EMBODIED CARBON AS A PROXY FOR THE ENVIRONMENTAL IMPACT OF EARTHQUAKE DAMAGE REPAIR"                                                                                                 
    ## [10] "IDENTIFICATION OF THE CRITICAL TRANSMISSION SECTORS AND TYPOLOGY OF INDUSTRIAL WATER USE FOR SUPPLY-CHAIN WATER PRESSURE MITIGATION"                                                 
    ## [11] "SOCIAL LIFE CYCLE ASSESSMENT OF FIRST AND SECOND-GENERATION ETHANOL PRODUCTION TECHNOLOGIES IN BRAZIL"                                                                               
    ## [12] "THE WATER-ENERGY-FOOD NEXUS IN EAST ASIA: A TELE-CONNECTED VALUE CHAIN ANALYSIS USING INTER-REGIONAL INPUT-OUTPUT ANALYSIS"                                                          
    ## [13] "A MULTI-REGION INPUT-OUTPUT MODEL FOR OPTIMIZING VIRTUAL WATER TRADE FLOWS IN AGRICULTURAL CROP PRODUCTION"                                                                          
    ## [14] "AN INPUT-OUTPUT BASED NET-ENERGY ASSESSMENT OF AN ELECTRICITY SUPPLY INDUSTRY"                                                                                                       
    ## [15] "PRODUCTION AND CONSUMPTION-BASED WATER DYNAMICS: A LONGITUDINAL ANALYSIS FOR THE EU27"                                                                                               
    ## [16] "THERMODYNAMIC INSIGHTS AND ASSESSMENT OF THE `CIRCULAR ECONOMY'"                                                                                                                     
    ## [17] "NETWORK ANALYSIS OF INTER-SECTORAL RELATIONSHIPS AND KEY SECTORS IN THE GREEK ECONOMY"                                                                                               
    ## [18] "URBAN ENERGY-WATER NEXUS BASED ON MODIFIED INPUT-OUTPUT ANALYSIS"                                                                                                                    
    ## [19] "INPUT-OUTPUT ANALYSIS OF INTERNATIONAL RESEARCH COLLABORATIONS: A CASE STUDY OF FIVE US UNIVERSITIES"                                                                                
    ## [20] "LOSS AND BENEFIT CAUSED BY A DIESEL ENGINE FROM THE PERSPECTIVE OF HUMAN HEALTH"                                                                                                     
    ## [21] "CARBON FOOTPRINT STOCK ANALYSIS OF US MANUFACTURING: A TIME SERIES INPUT-OUTPUT LCA"                                                                                                 
    ## [22] "THE VIRTUAL IELAB - AN EXERCISE IN REPLICATING PART OF THE EXIOBASE V.2 PRODUCTION PIPELINE IN A VIRTUAL LABORATORY"                                                                 
    ## [23] "SUSTAINABILITY CHALLENGES, HUMAN DIET AND ENVIRONMENTAL CONCERNS"                                                                                                                    
    ## [24] "REGIONAL DISTRIBUTION AND LOSSES OF END-OF-LIFE STEEL THROUGHOUT MULTIPLE PRODUCT LIFE CYCLES INSIGHTS FROM THE GLOBAL MULTIREGIONAL MATRACE MODEL"                                  
    ## [25] "A FUZZY DATA ENVELOPMENT ANALYSIS FRAMEWORK FOR DEALING WITH UNCERTAINTY IMPACTS OF INPUT-OUTPUT LIFE CYCLE ASSESSMENT MODELS ON ECO-EFFICIENCY ASSESSMENT"                          
    ## [26] "TRACKING INTER-REGIONAL CARBON FLOWS: A HYBRID NETWORK MODEL"                                                                                                                        
    ## [27] "ESTIMATION OF ECONOMIC IMPACTS OF CELLULOSIC BIOFUEL PRODUCTION: A COMPARATIVE ANALYSIS OF THREE BIOFUEL PATHWAYS"                                                                   
    ## [28] "INTEGRATING EXPERT WEIGHTING AND MULTI-CRITERIA DECISION MAKING INTO ECO-EFFICIENCY ANALYSIS: THE CASE OF US MANUFACTURING"                                                          
    ## [29] "AN INTEGRATED MODEL FOR MARINE FISHERY MANAGEMENT IN THE PEARL RIVER ESTUARY: LINKING SOCIO-ECONOMIC SYSTEMS AND ECOSYSTEMS"                                                         
    ## [30] "INPUT-OUTPUT LIFE CYCLE ENVIRONMENTAL ASSESSMENT OF GREENHOUSE GAS EMISSIONS FROM UTILITY SCALE WIND ENERGY IN THE UNITED STATES"                                                    
    ## [31] "ACCOUNTING FOR HIDDEN ENERGY DEPENDENCY: THE IMPACT OF ENERGY EMBODIED IN TRADED GOODS ON CROSS-COUNTRY ENERGY SECURITY ASSESSMENTS"                                                 
    ## [32] "RISK ASSESSMENT OF THE ECONOMIC IMPACTS OF CLIMATE CHANGE ON THE IMPLEMENTATION OF MANDATORY BIODIESEL BLENDING PROGRAMS: A FUZZY INOPERABILITY INPUT-OUTPUT MODELING (IIM) APPROACH"
    ## [33] "FLOW DISTANCES ON OPEN FLOW NETWORKS"                                                                                                                                                
    ## [34] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"                                                                                
    ## [35] "A NETWORK OF NETWORKS PERSPECTIVE ON GLOBAL TRADE"                                                                                                                                   
    ## [36] "THE FOOTPRINT OF USING METALS: NEW METRICS OF CONSUMPTION AND PRODUCTIVITY"                                                                                                          
    ## [37] "LABOR EMBODIED IN TRADE: THE ROLE OF LABOR AND ENERGY PRODUCTIVITY AND IMPLICATIONS FOR GREENHOUSE GAS EMISSIONS"                                                                    
    ## [38] "A STOCHASTIC RECOVERY MODEL OF INFLUENZA PANDEMIC EFFECTS ON INTERDEPENDENT WORKFORCE SYSTEMS"                                                                                       
    ## [39] "EQUIVALENCE OF THE REALIZED INPUT AND OUTPUT ORIENTED INDIRECT EFFECTS METRICS IN ECOLOGICAL NETWORK ANALYSIS"                                                                       
    ## [40] "INVENTORY DEVELOPMENT AND INPUT-OUTPUT MODEL OF US LAND USE: RELATING LAND IN PRODUCTION TO CONSUMPTION"                                                                             
    ## [41] "EMERGY ANALYSIS USING US ECONOMIC INPUT-OUTPUT MODELS WITH APPLICATIONS TO LIFE CYCLES OF GASOLINE AND CORN ETHANOL"                                                                 
    ## [42] "GREENHOUSE GAS EMISSIONS IN HAWAI'I: HOUSEHOLD AND VISITOR EXPENDITURE ANALYSIS"                                                                                                     
    ## [43] "SOLUTIONS TO STRATEGIC SUPPLY CHAIN MAPPING ISSUES"                                                                                                                                  
    ## [44] "1,3-PROPANEDIOL FROM FOSSILS VERSUS BIOMASS: A LIFE CYCLE EVALUATION OF EMISSIONS AND ECOLOGICAL RESOURCES"                                                                          
    ## [45] "ECOLOGICAL INPUT-OUTPUT ANALYSIS-BASED SUSTAINABILITY ANALYSIS OF INDUSTRIAL SYSTEMS"                                                                                                
    ## [46] "MEASURING MATERIAL CYCLING IN INDUSTRIAL SYSTEMS"                                                                                                                                    
    ## [47] "A FRAMEWORK FOR LINKING CYBERSECURITY METRICS TO THE MODELING OF MACROECONOMIC INTERDEPENDENCIES"                                                                                    
    ## [48] "INDUSTRIAL AND ECOLOGICAL CUMULATIVE EXERGY CONSUMPTION OF THE UNITED STATES VIA THE 1997 INPUT-OUTPUT BENCHMARK MODEL"                                                              
    ## [49] "FLOW OF NATURAL VERSUS ECONOMIC CAPITAL IN INDUSTRIAL SUPPLY NETWORKS AND ITS IMPLICATIONS TO SUSTAINABILITY"                                                                        
    ## [50] "HIERARCHICAL THERMODYNAMIC METRICS FOR EVALUATING THE ENVIRONMENTAL SUSTAINABILITY OF INDUSTRIAL PROCESSES"                                                                          
    ## [51] "THERMODYNAMIC ACCOUNTING OF ECOSYSTEM CONTRIBUTION TO ECONOMIC SECTORS WITH APPLICATION TO 1992 US ECONOMY"                                                                          
    ## [52] "A HIERARCHIC METRIC APPROACH FOR INTEGRATION OF GREEN ISSUES IN MANUFACTURING: A PAPER RECYCLING APPLICATION"                                                                        
    ## [53] "MATERIAL FLOW CHALLENGES IN INDUSTRIAL ECOSYSTEMS"                                                                                                                                   
    ## [54] "SUPPLY CHAIN COORDINATION IN SPATIAL GAMES"                                                                                                                                          
    ## [55] "ENVIRONMENTAL IMPLICATIONS OF SERVICE INDUSTRIES"                                                                                                                                    
    ## [56] "INPUT-OUTPUT-ANALYSIS OF ENERGY-REQUIREMENTS FOR SHORT ROTATION, INTENSIVE CULTURE, WOODY BIOMASS"                                                                                   
    ## [57] "OUTSOURCING, TRADE, TECHNOLOGY, AND GREENHOUSE GAS EMISSIONS"                                                                                                                        
    ## [58] "CARBON FOOTPRINT OF JAPANESE HEALTH CARE SERVICES FROM 2011 TO 2015"                                                                                                                 
    ## [59] "LIFE CYCLE SUSTAINABILITY ASSESSMENT OF AUTONOMOUS HEAVY-DUTY TRUCKS"                                                                                                                
    ## [60] "THE CIRCULARITY GAP OF NATIONS: A MULTIREGIONAL ANALYSIS OF WASTE GENERATION, RECOVERY, AND STOCK DEPLETION IN 2011"                                                                 
    ## [61] "CARBON COMMUNITIES AND HOTSPOTS FOR CARBON EMISSIONS REDUCTION IN CHINA"                                                                                                             
    ## [62] "DOES THE STRUCTURE OF INTERSECTORAL EMBEDDED CARBON FLOW NETWORK MATTER TO CARBON REDUCTION IN CHINA?"                                                                               
    ## [63] "ASSESSING REGIONAL AND GLOBAL ENVIRONMENTAL FOOTPRINTS AND VALUE ADDED OF THE LARGEST FOOD PRODUCERS IN THE WORLD"                                                                   
    ## [64] "THE RAW MATERIAL BASIS OF GLOBAL VALUE CHAINS: ALLOCATING ENVIRONMENTAL RESPONSIBILITY BASED ON VALUE GENERATION"                                                                    
    ## [65] "A METHOD FOR ECONOMIC INPUT-OUTPUT SOCIAL IMPACT ANALYSIS WITH APPLICATION TO US ADVANCED MANUFACTURING"

    io.bdf[q.met & q.ml, c("TI")]

    ## [1] "MODELLING MULTI-REGIONAL ECOLOGICAL EXCHANGES: THE CASE OF UK AND AFRICA"                               
    ## [2] "TRADING LAND: A REVIEW OF APPROACHES TO ACCOUNTING FOR UPSTREAM LAND REQUIREMENTS OF TRADED PRODUCTS"   
    ## [3] "INVENTORY DEVELOPMENT AND INPUT-OUTPUT MODEL OF US LAND USE: RELATING LAND IN PRODUCTION TO CONSUMPTION"

Resilience
----------

    io.bdf[q.res, c("TI")]

    ##  [1] "ECONOMIC CRISIS AND REGIONAL RESILIENCE: EVIDENCE FROM GREECE"                                                                                                              
    ##  [2] "CATCHMENT METABOLISM: INTEGRATING NATURAL CAPITAL IN THE ASSET MANAGEMENT PORTFOLIO OF THE WATER SECTOR"                                                                    
    ##  [3] "INOPERABILITY INPUT-OUTPUT MODELING: INVENTORY OPTIMIZATION AND RESILIENCE ESTIMATION DURING CRITICAL EVENTS"                                                               
    ##  [4] "EXAMINING THE RESILIENCE OF NATIONAL ENERGY SYSTEMS: MEASUREMENTS OF DIVERSITY IN PRODUCTION-BASED AND CONSUMPTION-BASED ELECTRICITY IN THE GLOBALIZATION OF TRADE NETWORKS"
    ##  [5] "INTERCONNECTEDNESS AND INTERDEPENDENCIES OF CRITICAL INFRASTRUCTURES IN THE US ECONOMY: IMPLICATIONS FOR RESILIENCE"                                                        
    ##  [6] "ECONOMIC IMPACT OF PRODUCTION BOTTLENECKS CAUSED BY DISASTERS IMPACTING INTERDEPENDENT INDUSTRY SECTORS"                                                                    
    ##  [7] "ENERGY IMPORT RESILIENCE WITH INPUT-OUTPUT LINEAR PROGRAMMING MODELS"                                                                                                       
    ##  [8] "TOWARD SUSTAINABLE CLIMATE CHANGE ADAPTATION"                                                                                                                               
    ##  [9] "ENERGY-ECONOMIC RESILIENCE WITH MULTI-REGION INPUT-OUTPUT LINEAR PROGRAMMING MODELS"                                                                                        
    ## [10] "MULTI-CRITERIA DECISION-MAKING FOR SEISMIC RESILIENCE AND SUSTAINABILITY ASSESSMENT OF DIAGRID BUILDINGS"                                                                   
    ## [11] "ANALYSING ECONOMIC IMPACT ON INTERDEPENDENT INFRASTRUCTURE AFTER FLOOD: PAKISTAN A CASE IN POINT"

Literature Review: Methods and Background
=========================================

    kw <- gsub(";", "", unlist(strsplit(io.bdf[, "DE"], split = "; ")))
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
<td align="left">Land</td>
<td align="right">72</td>
<td align="right">2.45</td>
</tr>
<tr class="even">
<td align="left">Network</td>
<td align="right">35</td>
<td align="right">1.19</td>
</tr>
<tr class="odd">
<td align="left">ENA</td>
<td align="right">35</td>
<td align="right">1.19</td>
</tr>
<tr class="even">
<td align="left">Resilience</td>
<td align="right">11</td>
<td align="right">0.37</td>
</tr>
<tr class="odd">
<td align="left">Disturbance</td>
<td align="right">0</td>
<td align="right">0.00</td>
</tr>
<tr class="even">
<td align="left">Climate Change</td>
<td align="right">84</td>
<td align="right">2.85</td>
</tr>
<tr class="odd">
<td align="left">Coupled Human-Natural</td>
<td align="right">0</td>
<td align="right">0.00</td>
</tr>
<tr class="even">
<td align="left">Metrics</td>
<td align="right">65</td>
<td align="right">2.21</td>
</tr>
<tr class="odd">
<td align="left">Land Metrics</td>
<td align="right">3</td>
<td align="right">0.10</td>
</tr>
<tr class="even">
<td align="left">Review or Overview</td>
<td align="right">19</td>
<td align="right">0.65</td>
</tr>
</tbody>
</table>

    export_query(io.bdf, q.all, dir = "data/wos-mrio_query", overwrite = TRUE)

    ## [1] "Disturbance had length zero and was removed."
    ## [1] "Coupled_Human-Natural had length zero and was removed."
    ## [1] "Land.csv"               "Network.csv"            "ENA.csv"               
    ## [4] "Resilience.csv"         "Climate_Change.csv"     "Metrics.csv"           
    ## [7] "Land_Metrics.csv"       "Review_or_Overview.csv"
    ## [1] "Successfully written to data/wos-mrio_query"

    mk_review(io.bdf, q.all, file = "results/wos_review.md", overwrite = TRUE)

Searched and Reviewed "Land" Query
----------------------------------

-   Searched within queried papers and found papers with MRIO, network
    or resilience
-   Need to add telecoupling and land-system science articles
-   Recompile using a cross-referencing = LAND & MRIO | NETWORK |
    RESILIENCE | SUSTAINABILITY

References
==========
