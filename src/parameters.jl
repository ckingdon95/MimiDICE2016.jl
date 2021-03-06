using ExcelReaders

function getdice2016excelparameters(filename)
    p = Dict{Symbol,Any}()

    T = 100

    #Open DICE_2016 Excel File to Read Parameters
    f = openxl(filename)

	p[:a0]			= getparams(f, "B108:B108", :single, "Parameters",1)#Initial level of total factor productivity
    p[:a1]          = getparams(f, "B25:B25", :single, "Base", 1)       #Damage coefficient on temperature
    p[:a2]          = getparams(f, "B26:B26", :single, "Base", 1)       #Damage quadratic term
    p[:a3]          = getparams(f, "B27:B27", :single, "Base", 1)       #Damage exponent
    p[:al]          = getparams(f, "B21:CW21", :all, "Base", T)         #Level of total factor productivity
    p[:b12]         = getparams(f, "B67:B67", :single, "Base", 1)       #Carbon cycle transition matrix atmosphere to shallow ocean
    p[:b23]         = getparams(f, "B70:B70", :single, "Base", 1)       #Carbon cycle transition matrix shallow to deep ocean
    p[:c1]          = getparams(f, "B82:B82", :single, "Base", 1)       #Speed of adjustment parameter for atmospheric temperature (per 5 years)
    p[:c3]          = getparams(f, "B83:B83", :single, "Base", 1)       #Coefficient of heat loss from atmosphere to oceans
    p[:c4]          = getparams(f, "B84:B84", :single, "Base", 1)       #Coefficient of heat gain by deep oceans
    p[:cca0]        = getparams(f, "B92:B92", :single, "Base", T)       #Initial cumulative industrial emissions
    p[:cost1]       = getparams(f, "B32:CW32", :all, "Base", T)         #Abatement cost function coefficient
    p[:cumetree0]   = 100							         			#Initial cumulative emissions from deforestation (see GAMS code)
    p[:damadj]      = getparams(f, "B65:B65", :single, "Parameters", 1) #Adjustment exponent in damage function
	p[:dela]		= getparams(f, "B110:B110", :single, "Parameters",1)#Decline rate of TFP per 5 years
	p[:deland]		= getparams(f, "D64:D64", :single, "Parameters", 1) #Decline rate of land emissions (per period)
    p[:dk]          = getparams(f, "B6:B6", :single, "Base", 1)         #Depreciation rate on capital (per year)
	p[:dsig]		= getparams(f, "B66:B66", :single, "Parameters", 1) #Decline rate of decarbonization (per period)
	p[:eland0]		= getparams(f, "D63:D63", :single, "Parameters", 1)	#Carbon emissions from land 2015 (GtCO2 per year)
	p[:e0]			= getparams(f, "B113:B113", :single, "Base", 1)		#Industrial emissions 2015 (GtCO2 per year)
    p[:elasmu]      = getparams(f, "B19:B19", :single, "Base", 1)       #Elasticity of MU of consumption
    p[:eqmat]       = getparams(f, "B82:B82", :single, "Parameters", 1) #Equilibirum concentration of CO2 in atmosphere (GTC)
    p[:expcost2]    = getparams(f, "B39:B39", :single, "Base", 1)       #Exponent of control cost function
    p[:fco22x]      = getparams(f, "B80:B80", :single, "Base", 1)       #Forcings of equilibrium CO2 doubling (Wm-2)
	p[:fex0]		= getparams(f, "B87:B87", :single, "Parameters", 1) #2015 forcings of non-CO2 GHG (Wm-2)
	p[:fex1]		= getparams(f, "B88:B88", :single, "Parameters", 1) #2100 forcings of non-CO2 GHG (Wm-2)
    p[:fosslim]     = getparams(f, "B57:B57", :single, "Base", 1)       #Maximum carbon resources (Gtc)
	p[:ga0]			= getparams(f, "B109:B109", :single, "Parameters",1)#Initial growth rate for TFP per 5 years
    p[:gama]        = getparams(f, "B5:B5", :single, "Base", 1)         #Capital Share
	p[:gback]		= getparams(f, "B26:B26", :single, "Parameters", 1) #Initial cost decline backstop cost per period
	p[:gsigma1]		= getparams(f, "B15:B15", :single, "Parameters", 1)	#Initial growth of sigma (per year)
    p[:k0]          = getparams(f, "B12:B12", :single, "Base", 1)       #Initial capital
    p[:l]           = getparams(f, "B53:CW53", :all, "Base", T)         #Level of population and labor (millions)
    p[:mat0]        = getparams(f, "B61:B61", :single, "Base", 1)       #Initial Concentration in atmosphere in 2015 (GtC)
	p[:mateq]		= getparams(f, "B82, B82", :single, "Parameters", 1)#Equilibrium concentration atmosphere  (GtC)
    p[:MIU]         = getparams(f, "B135:CW135", :all, "Base", T)       #Optimized emission control rate results from DICE2016R (base case)
    p[:ml0]         = getparams(f, "B63:B63", :single, "Base", 1)       #Initial Concentration in deep oceans 2010 (GtC)
	p[:mleq]		= getparams(f, "B84, B84", :single, "Parameters", 1)#Equilibrium concentration in lower strata (GtC)
    p[:mu0]         = getparams(f, "B62:B62", :single, "Base", 1)       #Initial Concentration in biosphere/shallow oceans 2010 (GtC)
	p[:mueq]		= getparams(f, "B83:B83", :single, "Parameters", 1) #Equilibrium concentration in upper strata (GtC)
    p[:pback]	    = getparams(f, "B10:B10", :single, "Parameters", 1) #Cost of backstop 2010$ per tCO2 2015
    p[:rr]          = getparams(f, "B18:CW18", :all, "Base", T)         #Social Time Preference Factor
    p[:S]           = getparams(f, "B131:CW131", :all, "Base", T)       #Optimized savings rate (fraction of gross output) results from DICE2016 (base case)
    p[:scale1]      = getparams(f, "B49:B49", :single, "Base", 1)       #Multiplicative scaling coefficient
    p[:scale2]      = getparams(f, "B50:B50", :single, "Base", 1)       #Additive scaling coefficient
    p[:t2xco2]      = getparams(f, "B79:B79", :single, "Base", 1)       #Equilibrium temp impact (oC per doubling CO2)
    p[:tatm0]       = getparams(f, "B76:B76", :single, "Base", 1)       #Initial atmospheric temp change 2015 (C from 1940-60)
    p[:tocean0]     = getparams(f, "B77:B77", :single, "Base", 1)       #Initial temperature of deep oceans (deg C above 1940-60)

    return p
end

function getdice2016gamsparameters(filename)
    p = Dict{Symbol,Any}()

    T = 100

    #Open DICE_2016 Excel File to Read Parameters
    f = openxl(filename)
    sheet = "DICE2016_Base"

	p[:a0]			= 5.115											   #Initial level of total factor productivity
    p[:a1]          = getparams(f, "B41:B41", :single, sheet, 1)       #Damage coefficient on temperature
    p[:a2]          = getparams(f, "B42:B42", :single, sheet, 1)       #Damage quadratic term
    p[:a3]          = getparams(f, "B43:B43", :single, sheet, 1)       #Damage exponent
    p[:al]          = getparams(f, "B5:CWI5", :all, sheet, T)          #Level of total factor productivity
    p[:b12]         = getparams(f, "B20:B20", :single, sheet, 1)       #Carbon cycle transition matrix atmosphere to shallow ocean
    p[:b23]         = getparams(f, "B21:B21", :single, sheet, 1)       #Carbon cycle transition matrix shallow to deep ocean
    p[:c1]          = getparams(f, "B36:B36", :single, sheet, 1)       #Speed of adjustment parameter for atmospheric temperature (per 5 years)
    p[:c3]          = getparams(f, "B37:B37", :single, sheet, 1)       #Coefficient of heat loss from atmosphere to oceans
    p[:c4]          = getparams(f, "B38:B38", :single, sheet, 1)       #Coefficient of heat gain by deep oceans
    p[:cca0]        = getparams(f, "B14:B14", :single, sheet, 1)       #Initial cumulative industrial emissions
    p[:cost1]       = getparams(f, "B46:CW46", :all, sheet, T)         #Abatement cost function coefficient
    p[:cumetree0]   = 100											   #Initial cumulative emissions from deforestation (see GAMS code)
    p[:damadj]      = getparams(f, 10.)                                #Adjustment exponent in damage function
	p[:dela]		= 0.0050										   #Decline rate of TFP per 5 years
	p[:deland]		= 0.115											   #Decline rate of land emissions (per period)
    p[:dk]          = getparams(f, "B8:B8", :single, sheet, 1)         #Depreciation rate on capital (per year)
	p[:dsig]		= -0.001										   #Decline rate of decarbonization (per period)
	p[:eland0]		= 2.6										   	   #Carbon emissions from land 2015 (GtCO2 per year)
	p[:e0]			= 35.74471365402390								   #Industrial emissions 2015 (GtCO2 per year)
    p[:elasmu]      = getparams(f, "B54:B54", :single, sheet, 1)       #Elasticity of MU of consumption
    p[:eqmat]       = getparams(f, 588.)                               #Equilibirum concentration of CO2 in atmosphere (GTC)
    p[:expcost2]    = getparams(f, "B48:B48", :single, sheet, 1)       #Exponent of control cost function
    p[:fco22x]      = getparams(f, "B30:B30", :single, sheet, 1)       #Forcings of equilibrium CO2 doubling (Wm-2)
	p[:fex0]		= 0.5											   #2015 forcings of non-CO2 GHG (Wm-2)
	p[:fex1]		= 1.0											   #2100 forcings of non-CO2 GHG (Wm-2)
	p[:ga0]			= 0.0760										   #Initial growth rate for TFP per 5 years
    p[:gama]        = getparams(f, "B7:B7", :single, sheet, 1)         #Capital Share
	p[:gback]		= 0.025										 	   #Initial cost decline backstop cost per period
	p[:gsigma1]		= -0.0152										   #Initial growth of sigma (per year)
    p[:k0]          = getparams(f, "B9:B9", :single, sheet, 1)         #Initial capital
    p[:l]           = getparams(f, "B6:CW6", :all, sheet, T)           #Level of population and labor (millions)
    p[:mat0]        = getparams(f, "B17:B17", :single, sheet, 1)       #Initial Concentration in atmosphere in 2015 (GtC)
	p[:mateq]		= getparams(f, "B82, B82", :single, "Parameters",1)#Equilibrium concentration atmosphere  (GtC)
    p[:MIU]         = getparams(f, "B47:CW47", :all, sheet, T)         #Optimized emission control rate results from DICE2016R (base case)
    p[:ml0]         = getparams(f, "B19:B19", :single, sheet, 1)       #Initial Concentration in deep oceans 2015 (GtC)
	p[:mleq]		= getparams(f, "B84, B84", :single, "Parameters",1)#Equilibrium concentration in lower strata (GtC)
    p[:mu0]         = getparams(f, "B18:B18", :single, sheet, 1)       #Initial Concentration in biosphere/shallow oceans 2015 (GtC)
	p[:mueq]		= getparams(f, "B83:B83", :single, "Parameters", 1)#Equilibrium concentration in upper strata (GtC)
    p[:partfract]   = getparams(f, "B49:CW49", :all, sheet, T)         #Fraction of emissions in control regime
    p[:pback]	    = 550											   #Cost of backstop 2010$ per tCO2 2015
    p[:rr]          = getparams(f, "B55:CW55", :all, sheet, T)         #Social Time Preference Factor
    p[:S]           = getparams(f, "B51:CW51", :all, sheet, T)         #Optimized savings rate (fraction of gross output) results from DICE2016R (base case)
    p[:scale1]      = getparams(f, "B56:B56", :single, sheet, 1)       #Multiplicative scaling coefficient
    p[:scale2]      = getparams(f, "B57:B57", :single, sheet, 1)       #Additive scaling coefficient
    p[:t2xco2]      = getparams(f, "B33:B33", :single, sheet, 1)       #Equilibrium temp impact (oC per doubling CO2)
    p[:tatm0]       = getparams(f, "B34:B34", :single, sheet, 1)       #Initial atmospheric temp change (C from 1900)
    p[:tocean0]     = getparams(f, "B35:B35", :single, sheet, 1)       #Initial temperature of deep oceans (deg C above 1900)

    return p
end