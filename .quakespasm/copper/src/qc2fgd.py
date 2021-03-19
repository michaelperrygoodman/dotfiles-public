import os, datetime



def getQuakeds(qc):
	defOut = ""
	numDefs = 0
	start = 0
	end = 0
	
	while 1:
		start = qc.find("/*FGD",start)
		if start == -1:
			return defOut, numDefs
		#print( "adding ", qc[start + 9 : qc.find(" ",start + 9)] )
		end = qc.find("*/",start)
		defOut += qc[start + 5 : end].strip() + "\n"
		numDefs += 1
		start = end

def go():
	cwd = os.path.dirname(os.path.realpath(__file__))
	qcDir = cwd + "\\"
	fgdDir = cwd + "\\..\\"

	print("Scanning *.qc for FGD comments...")
	defOut = """// Copper Quake game definition file (.fgd)
// for Worldcraft 1.6 and above

// Based heavily on quake.fgd by autolycus/czg/et al
// Generated from Copper QuakeC source comments on """
	numDefs = 0
	defOut += datetime.datetime.now().strftime("%m.%d.%Y")
	defOut += "\n"
	
	for qcfn in os.listdir(qcDir):
		if not qcfn.endswith(".qc"):
			continue
		with open(qcDir+qcfn, "r") as qcfile:
			qc = qcfile.read()
		defs, n = getQuakeds(qc)
		if (n):
			defOut += "\n//\n// " + qcfn + "\n//\n"
			defOut += defs
			numDefs += n
			defOut += "\n"
	
	dfn = fgdDir + "copper.fgd"
	with open(dfn, "w") as df:
		df.write(defOut)
	print("Completed, found",numDefs)

if __name__ == "__main__":
	go()