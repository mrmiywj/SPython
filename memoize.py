###############################################
##
## File: MEMOIZE.SCM
## @authors Michael Ferrin; Karan Das
## 
## Schython; Project 4
## CS61AS
## Fall 14

##(*9)
## Prevent repetitive computation of
## of function calls that contain same input.
## Note that procedures can be defined within other 
## procedures, and procedures can be returned.

#def memoize():
# k = procedure(i, help)
#  def helper(i):
#   if i in info:
#    return info[i]
#     else:
#      info[i] = k
#       return help

def memoize(procedure):
    info = {}
    def help(i):
        if i in info:
            return info[i]
        elif i not in info:
            k = procedure(i, help)
            info[i] = k
            return info[i]
    return help