public class DigSplash : SplashScreen { 
    private AppSplash appSlash;

    fun transitionToFlutter(@NonNull Runnable onTransitionComplete) {
        appSlash.animateAway(onTransitionComplete);
    }
}