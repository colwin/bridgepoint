---

This work is licensed under the Creative Commons CC0 License

---

# Title goes here
### xtUML Project Implementation Note

Note: Each section has a description that states the purpose of that section.
Delete these section descriptions before checking in your note.  Delete this
note as well. __If you are using markdown formatting, don't forget to put 2 
spaces at the end of lines where you want a hard break.__

1. Abstract
-----------
In this section, give a summary of the design that this note aims to
describe.

2. Document References
----------------------
In this section, list all the documents that the reader may need to refer to.
Give the full path to reference a file.  
<a id="2.1"></a>2.1 [BridgePoint DEI #xxx1](https://support.onefact.net/issues/xxx1) TODO: Add description here.  
<a id="2.2"></a>2.3 [BridgePoint DEI #xxx2](https://support.onefact.net/issues/xxx2) TODO: Add description here.  
<a id="2.3"></a>2.3 [BridgePoint DEI #xxx3](https://support.onefact.net/issues/xxx3) TODO: Add description here.  

3. Background
-------------
In this section, outline the important points relating to this issue/bug that
the reader would need to know in order to understand the rest of this
document. Here is an example reference to the Document References section [[2.1]](#2.1)

4. Requirements
---------------
This section is only required if there is no preceding design note. 
If present it describes the requirements that need to be satisfied.  If there 
is an SRS, this section may refer to it.  Each requirement should be as short 
and simple as possible and must be clearly defined. Here is an example reference to the Document References section [[2.1]](#2.1)

4.1 Item 1  
4.1.1 Example sub-item
* Example List Element
  * Example Sub list item

4.2 Item 2  
4.2.1 Example sub-item
* Example List Element

5. Work Required
----------------
Elaborate on each point of the Work Required section of the design note and
describe how you implemented each step.  
If there is no design note, this section, breaks out the consequential work 
(as a numbered list) needed to meet the requirements specified in the 
Requirements section. Here is an example reference to the Document References section [[2.1]](#2.1)

5.1 Item 1  
5.1.1 Example sub-item
* Example List Element

5.2 Item 2  
5.2.1 Example sub-item
* Example List Element

6. Implementation Comments
--------------------------
If the design cannot be implemented as written or if it needs some modification,
enumerate the changes to the design in this section.  If there was no preceding
design note, then this section documents any deviations from the implementation
as presented at the pre-implementation engineering review. Here is an example reference to the Document References section [[2.1]](#2.1)

6.1 Item 1  
```java
    // java code example
    public void clearDatabase(IProgressMonitor pm) 
    {
        // clear the corresponding graphics-root's database
        OoaofgraphicsUtil.clearGraphicsDatabase(rootId, pm);

        Ooaofooa.getDefaultInstance().fireModelElementUnloaded(this);
    }
```
6.1.1 Example sub-item
* Example List Element

6.2 Item 2  
6.2.1 Example sub-item
* Example List Element

7. Unit Test
------------
Outline all the unit tests that need to pass and describe the method that you
will use to design and perform the tests. Here is an example reference to the Document References section [[2.1]](#2.1)

7.1 Item 1  
7.1.1 Example sub-item
* Example List Element

7.2 Item 2  
7.2.1 Example sub-item
* Example List Element

8. User Documentation
---------------------
Describe the end user documentation that was added for this change. 

9. Code Changes
---------------
Branch name: < enter your branch name here >

<pre>

< Put the file list here >

</pre>

End
---
