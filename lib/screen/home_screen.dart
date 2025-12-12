import 'package:ai_assistant/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../screen/feature/chatbot_feature.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{
  late AnimationController _controller;
  late Animation<double> _animation;
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  void initState()
  {
    super.initState();
    _controller=AnimationController(
      vsync:this,
      duration:const Duration(seconds: 4),
    )..repeat(reverse:true);
    _animation=Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Text(
          'MAD AI',
          style:GoogleFonts.poppins(
            fontWeight:FontWeight.w600,
          ),
        ),
        actions:[
          Obx(
            () => IconButton(
              icon:Icon(
                _themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: _themeController.toggleTheme,
            ),
          ),
        ],
      ),
      body:Stack(
        children: [
          // Decorative background shapes
          Positioned(
            top: -100,
            right: -120,
            child: _buildDecorativeShape(250),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: _buildDecorativeShape(300),
          ),
          // Main content
          Center(
            child:SingleChildScrollView(
              padding:const EdgeInsets.symmetric(horizontal: 24.0),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  // Lottie Animation
                  AnimatedBuilder(
                    animation:_animation,
                    builder:(context, child)
                    {
                      return Transform.translate(
                        offset:Offset(0, _animation.value),
                        child:child,
                      );
                    },
                    child:Lottie.asset(
                      'assets/lottie/chat pot.json',
                      width: 150,
                    ),
                  ),
                  const SizedBox(height:20),
                  _buildHeroCard(context),
                  const SizedBox(height:40),
                  _buildCtaButton(),
                  const SizedBox(height:40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDecorativeShape(double size)
  {
    return Container(
      width:size,
      height:size,
      decoration:BoxDecoration(
        shape:BoxShape.circle,
        color:Theme.of(context).primaryColor.withOpacity(0.08),
      ),
    );
  }
  Widget _buildHeroCard(BuildContext context)
  {
    return Container(
      width:double.infinity,
      padding:const EdgeInsets.all(24),
      decoration:BoxDecoration(
        gradient:LinearGradient(
          colors:[
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).canvasColor
          ],
          begin:Alignment.topLeft,
          end:Alignment.bottomRight,
        ),
        borderRadius:BorderRadius.circular(20),
        boxShadow:[
          BoxShadow(
            color:Theme.of(context).shadowColor.withOpacity(0.08),
            blurRadius:20,
            offset:const Offset(0,4),
          ),
        ],
      ),
      child:Column(
        children:[
          Text(
            'MAD AI',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your Personal AI Assistant',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Developed by\nTasnim · Jannatul · Shahriar · Mehedi · Noman',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    ).animate().fade(duration: 800.ms).slideY(begin: 0.2, end: 0);
  }
  Widget _buildCtaButton()
  {
    return GestureDetector(
      onTap:() => Get.to(() => const ChatBotFeature()),
      child:Container(
        padding:const EdgeInsets.symmetric(vertical: 16),
        decoration:BoxDecoration(
          color:Colors.black, // Changed to a solid black color
          borderRadius:BorderRadius.circular(16),
          boxShadow:[
            BoxShadow(
              color:Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset:const Offset(0, 4),
            ),
          ],
        ),
        child:Center(
          child:Text(
            'Start Chatting',
            style: GoogleFonts.poppins(
              fontSize:18,
              fontWeight:FontWeight.w600,
              color:Colors.white, // Text is already white, which is perfect
            ),
          ),
        ),
      ),
    ).animate().scale(delay: 400.ms, duration: 600.ms, curve: Curves.elasticOut);
  }
}
