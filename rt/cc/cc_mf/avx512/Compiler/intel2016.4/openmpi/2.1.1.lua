help([==[

Description
===========
The Open MPI Project is an open source MPI-2 implementation.


More information
================
 - Homepage: http://www.open-mpi.org/
]==])

whatis([==[Description: The Open MPI Project is an open source MPI-2 implementation.]==])
whatis([==[Homepage: http://www.open-mpi.org/]==])

local root = "/cvmfs/soft.computecanada.ca/easybuild/software/2017/avx512/Compiler/intel2016.4/openmpi/2.1.1"

conflict("openmpi")
local mroot = os.getenv("MODULEPATH_ROOT")
prepend_path("MODULEPATH", pathJoin(mroot,"avx512/MPI/intel2016.4/openmpi2.1"))

prepend_path("CPATH", pathJoin(root, "include"))
prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("MANPATH", pathJoin(root, "share/man"))
prepend_path("PATH", pathJoin(root, "bin"))
prepend_path("PKG_CONFIG_PATH", pathJoin(root, "lib/pkgconfig"))
setenv("EBROOTOPENMPI", root)
setenv("EBVERSIONOPENMPI", "2.1.1")
setenv("EBDEVELOPENMPI", pathJoin(root, "easybuild/avx512-Compiler-intel2016.4-openmpi-2.1.1-easybuild-devel"))


if os.getenv("RSNT_INTERCONNECT") == "omnipath" then
        setenv("OMPI_MCA_mtl", "^mxm")
        setenv("OMPI_MCA_pml", "^yalla")
end

family("mpi")

-- Built with EasyBuild version 3.6.0
