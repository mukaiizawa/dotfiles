import java.io.*;
import java.util.*;
import javax.lang.model.*;
import javax.lang.model.element.*;
import javax.lang.model.util.*;

import com.sun.source.doctree.*;
import com.sun.source.util.*;
import jdk.javadoc.doclet.*;

/*
 * javac CustomDoclet.java
 * javadoc -doclet CustomDoclet ^
 *         -docletpath .\ ^
 *         -encoding "utf-8" ^
 *         -classpath ./foo.jar;bar.jar ^
 *         -sourcepath ./foo/src;./bar/src; ^
 *         -subpackages java;com.sum
 */
public class CustomDoclet implements Doclet {

  class CustomScanner extends ElementScanner9<Void, Void> {
    Element currPackage;
    Element currClass;

    public Void scan(Element e, Void p) {
      switch (e.getKind()) {
        case PACKAGE:
          currPackage = e;
          break;
        case CLASS:
          currClass = e;
          break;
        case METHOD:
          if (e.getModifiers().contains(Modifier.PUBLIC)) {
            String sstatic = "static ";
            if (!e.getModifiers().contains(Modifier.STATIC)) sstatic = "";
            System.out.printf("\"%s\",\"%s\",\"%s%s\"\n"
                ,  currPackage, currClass.getSimpleName(), sstatic, e.toString());
          }
          return null;
        default:
          return null;
      }
      return super.scan(e, p);
    }

  }

  @Override
  public void init(Locale locale, Reporter reporter) {
  }

  @Override
  public String getName() {
    return getClass().getSimpleName();
  }

  @Override
  public Set<? extends Option> getSupportedOptions() {
    return Collections.emptySet();
  }

  @Override
  public SourceVersion getSupportedSourceVersion() {
    return SourceVersion.latest();
  }

  @Override
  public boolean run(DocletEnvironment env) {
    DocTrees trees = env.getDocTrees();
    CustomScanner scanner = new CustomScanner();
    env.getSpecifiedElements().forEach(x -> scanner.scan(x));
    return true;
  }

}
