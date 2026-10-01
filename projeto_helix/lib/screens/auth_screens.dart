import 'package:flutter/material.dart';

import '../widgets/helix_ui.dart';

/// The opening artwork is exported separately from the original Figma vector.
/// All controls remain Flutter widgets and intentionally have no actions yet.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HelixCanvas(
      background: HelixColors.darkBlue,
      children: [
        Positioned(
          left: 10,
          top: 24,
          width: 152,
          height: 75,
          child: Image.asset(
            'assets/images/welcome_wordmark.png',
            semanticLabel: 'HELIX cromossomos.',
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          left: 0,
          top: 100,
          width: 283,
          height: 270,
          child: Image.asset(
            'assets/images/welcome_illustration.png',
            semanticLabel: 'Estudante usando um notebook',
            filterQuality: FilterQuality.high,
          ),
        ),
        const Positioned(
          left: 54,
          top: 385,
          width: 175,
          height: 43,
          child: HelixButton(
            label: 'ENTRAR',
            background: HelixColors.cream,
            foreground: HelixColors.ink,
          ),
        ),
        const Positioned(
          left: 52,
          top: 442,
          width: 179,
          child: HelixText(
            'Não tem uma conta?',
            display: false,
            size: 13,
            color: Colors.white,
            align: TextAlign.center,
          ),
        ),
        const Positioned(
          left: 54,
          top: 462,
          width: 175,
          height: 43,
          child: HelixButton(
            label: 'CADASTRAR-SE',
            background: HelixColors.cream,
            foreground: HelixColors.ink,
          ),
        ),
      ],
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HelixCanvas(
      background: HelixColors.darkBlue,
      children: const [
        Positioned.fill(child: ColoredBox(color: HelixColors.cream)),
        _AuthBackground(top: 70),
        Positioned(left: 10, top: 15, child: HelixBackButton()),
        Positioned(
          left: 36,
          top: 23,
          width: 211,
          child: HelixText(
            'CADASTRO',
            size: 28,
            display: false,
            weight: FontWeight.w700,
            align: TextAlign.center,
          ),
        ),
        Positioned(
          left: 36,
          top: 93,
          child: _AuthField(label: 'Nome', placeholder: 'João Silva Oliveira'),
        ),
        Positioned(
          left: 36,
          top: 157,
          child: _AuthField(label: 'Nascimento', placeholder: 'dd/mm/aaaa'),
        ),
        Positioned(
          left: 35,
          top: 221,
          child: _AuthField(label: 'Email', placeholder: 'exemplo@exemplo.com'),
        ),
        Positioned(
          left: 36,
          top: 285,
          child: _AuthField(
            label: 'Senha',
            placeholder: '************************',
          ),
        ),
        Positioned(
          left: 36,
          top: 349,
          child: _AuthField(
            label: 'Confirmar senha',
            placeholder: '************************',
          ),
        ),
        Positioned(
          left: 35,
          top: 413,
          width: 212,
          height: 43,
          child: HelixButton(label: 'CADASTRAR-SE'),
        ),
        Positioned(left: 36, top: 464, child: _AuthDivider()),
        Positioned(left: 36, top: 476.52, child: _SocialButton.google()),
        Positioned(left: 158, top: 477.52, child: _SocialButton.apple()),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HelixCanvas(
      background: HelixColors.darkBlue,
      children: const [
        Positioned.fill(child: ColoredBox(color: HelixColors.cream)),
        _AuthBackground(top: 71),
        Positioned(left: 10, top: 15, child: HelixBackButton()),
        Positioned(
          left: 36,
          top: 23,
          width: 211,
          child: HelixText(
            'LOG IN',
            size: 28,
            display: false,
            weight: FontWeight.w700,
            align: TextAlign.center,
          ),
        ),
        Positioned(
          left: 36,
          top: 113,
          child: _AuthField(
            label: 'Email',
            placeholder: 'exemplo@exemplo.com',
            placeholderInset: 32,
          ),
        ),
        Positioned(
          left: 36,
          top: 182,
          child: _AuthField(
            label: 'Senha',
            placeholder: '************************',
            placeholderInset: 32,
          ),
        ),
        Positioned(
          left: 131,
          top: 241,
          width: 117,
          child: _UnderlinedText('Esqueceu a senha?'),
        ),
        Positioned(
          left: 36,
          top: 270,
          width: 212,
          height: 43,
          child: HelixButton(label: 'ENTRAR'),
        ),
        Positioned(left: 36, top: 326, child: _AuthDivider()),
        Positioned(left: 36, top: 338.52, child: _SocialButton.google()),
        Positioned(left: 158, top: 339.52, child: _SocialButton.apple()),
        Positioned(
          left: 40,
          top: 504,
          width: 129,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: HelixText(
              'Não tem uma conta?',
              display: false,
              size: 13,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 171,
          top: 504,
          width: 74,
          child: _UnderlinedText('Criar conta.'),
        ),
      ],
    );
  }
}

class _AuthBackground extends StatelessWidget {
  const _AuthBackground({required this.top});

  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -17,
      top: top,
      width: 409,
      height: 628 - top,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: HelixColors.darkBlue,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.label,
    required this.placeholder,
    this.placeholderInset = 10,
  });

  final String label;
  final String placeholder;
  final double placeholderInset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212,
      height: 43,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF7FAEC7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 4,
              child: HelixText(
                label,
                size: 16,
                display: false,
                weight: FontWeight.w700,
              ),
            ),
            Positioned(
              left: placeholderInset,
              right: 6,
              top: 21,
              height: 20,
              child: TextField(
                readOnly: true,
                canRequestFocus: false,
                enableInteractiveSelection: false,
                showCursor: false,
                keyboardType: TextInputType.none,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  height: 1,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: placeholder,
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                    color: HelixColors.cream.withValues(alpha: 0.7),
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthDivider extends StatelessWidget {
  const _AuthDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 212,
      height: 1,
      child: ColoredBox(color: Colors.white),
    );
  }
}

class _UnderlinedText extends StatelessWidget {
  const _UnderlinedText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          letterSpacing: 0,
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          decorationThickness: 1,
          height: 1.5,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton.google() : apple = false;
  const _SocialButton.apple() : apple = true;

  final bool apple;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 33,
      child: TextButton(
        onPressed: null,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          backgroundColor: WidgetStatePropertyAll(
            HelixColors.cream.withValues(alpha: 0.3),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: apple ? 4 : 6),
            Image.asset(
              apple
                  ? 'assets/images/apple_mark.png'
                  : 'assets/images/google_mark.png',
              width: apple ? 20.2105 : 20,
              height: apple ? 24 : 20,
              excludeFromSemantics: true,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(width: apple ? 9 : 6),
            HelixText(
              apple ? 'Apple' : 'Google',
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
