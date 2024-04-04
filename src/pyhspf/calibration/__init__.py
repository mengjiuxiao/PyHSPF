#!/usr/bin/python
#在 Python 中，__init__.py 文件用于标识一个目录作为一个包，其中可以包含一些初始化代码或导入其他模块的声明。
#指定 Python 解释器的路径，用于运行这个脚本。
"""
This is the __init__ file
"""
#这是一个多行字符串，提供了对这个 __init__.py 文件的简短描述。

version = '0.1'
#定义了一个名为 version 的变量，并赋值为 '0.1'。

__all__ = ['hydrologycalibrator', 
           'sedimentcalibrator', 
           'calibrate', 
           'validate',
           'autocalibrator',
           'calibratormodel',
           ]
#定义了一个名为 __all__ 的列表，该列表包含了这个模块中允许导出（import * 语句导入的）的模块或变量名。
#接下来的几行代码都是注释掉的 import 语句，它们原本可能用于导入其他模块或变量，但现在是被注释掉的状态，不会执行。
#最后两行代码是实际的 import 语句，导入了 AutoCalibrator 和 CalibratorModel 这两个类（或模块）。

#from .hydrologycalibrator import HydrologyCalibrator
#from .hydrologycalibrator import HydrologyParameters
#from .hydrologycalibrator import HydrologyErrors
#from .sedimentcalibrator  import SedimentCalibrator
#from .calibrate           import hydrology
#from .calibrate           import sediment
#from .validate            import validate
from .autocalibrator      import AutoCalibrator
from .calibratormodel     import CalibratorModel

#总的来说，这个 __init__.py 文件定义了一些初始化信息，包括模块的版本号和允许导出的模块或变量列表，并导入了两个特定的类或模块。
