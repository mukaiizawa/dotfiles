// Thread

// simple way.

  class Main {	
    static void main() {
      Thread th = new Thread(Main::run);
      th.start();
    }

    static void run() {
      // ...
    }
  }

// override Thread class.

  class Main {
    static void main() {
      Thread th = new XThread();
      th.start();
    }
  }

  class XThread extends Thread {
    @override
    public void run() {
      // ...
    }
  }

// wait all threads finish.

  class Main {
    static void main() {
      Set<Thread> threads = new HashSet<>();
      for (int i = 0; i < 10; i++)
        threads.add(new XThread());
      // start.
      for (Thread th: threads) th.start();
      // wait.
      for (Thread th: threads) th.join();
    }
  }
