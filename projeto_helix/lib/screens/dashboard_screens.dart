import 'package:flutter/material.dart';

import '../widgets/design_vectors.dart';
import '../widgets/helix_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelixCanvas(
      children: [
        Positioned(
          left: 16,
          top: 25,
          width: 24,
          height: 24,
          child: _StaticIcon(DesignVector.search, 'Pesquisar'),
        ),
        Positioned(
          left: 49,
          top: 25,
          width: 24,
          height: 24,
          child: _StaticIcon(DesignVector.notification, 'Notificações'),
        ),
        Positioned(
          left: 220,
          top: 16,
          width: 44,
          height: 44,
          child: _Avatar(
            size: 44,
            innerSize: 38,
            borderWidth: 2,
            borderColor: Color(0xFF7FAEC7),
          ),
        ),
        Positioned(
          left: 14,
          top: 113,
          width: 257,
          child: Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: HelixText(
              'Bem vindo(a),\n"Nome completo"',
              size: 24,
              height: 28 / 24,
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: 172,
          width: 110,
          height: 180,
          child: _HomeCard(
            title: 'Antes de\ncomeçar',
            description:
                'Uma breve\nintrodução antes\nde explorar as\nalterações.',
            background: Color(0xFF2D7594),
            titleBaseline: 27,
            bodyBaseline: 73,
          ),
        ),
        Positioned(
          left: 142,
          top: 172,
          width: 110,
          height: 120,
          child: _HomeCard(
            title: 'Fixando o\nconteúdo',
            description: 'Cartões curtos\npara fixar o que\nvocê aprendeu.',
            background: HelixColors.mediumBlue,
            titleBaseline: 23,
            bodyBaseline: 73,
          ),
        ),
        Positioned(
          left: 28,
          top: 356,
          width: 110,
          height: 120,
          child: _HomeCard(
            title: 'Recursos\nextras',
            description: 'Vídeos, artigos e\nsites pra ir além\ndo app.',
            background: HelixColors.mediumBlue,
            titleBaseline: 21,
            bodyBaseline: 63,
          ),
        ),
        Positioned(
          left: 142,
          top: 296,
          width: 110,
          height: 180,
          child: _HomeCard(
            title: 'Explorar\nalterações',
            description: 'Descubra causas,\ncaracterísticas\ne curiosidades.',
            background: Color(0xFF2D7594),
            titleBaseline: 24,
            bodyBaseline: 70,
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelixCanvas(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: DesignVectorPainter(DesignVector.profileWaveBack),
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: DesignVectorPainter(DesignVector.profileWaveFront),
          ),
        ),
        Positioned(
          left: 10,
          top: 15,
          child: HelixBackButton(color: Colors.black),
        ),
        Positioned(
          left: 98,
          top: 41,
          width: 87,
          height: 87,
          child: _Avatar(
            size: 87,
            innerSize: 80,
            borderWidth: 1,
            borderColor: HelixColors.darkBlue,
          ),
        ),
        Positioned(
          left: 80,
          top: 144.3,
          width: 123,
          child: Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: SizedBox(
              width: 123,
              child: HelixText(
                'Fulano de Tal',
                size: 12,
                display: false,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          top: 277,
          width: 260,
          height: 34,
          child: _ProfileOption(
            label: 'Gerenciar perfil',
            vector: DesignVector.profileManage,
            iconOffset: 17,
            labelBaseline: 25,
            iconTop: 0,
          ),
        ),
        Positioned(
          left: 12,
          top: 326,
          width: 260,
          height: 34,
          child: _ProfileOption(
            label: 'Senha e segurança',
            vector: DesignVector.profileLock,
            iconOffset: 17,
            labelBaseline: 23,
            iconTop: 0,
          ),
        ),
        Positioned(
          left: 10,
          top: 375,
          width: 260,
          height: 34,
          child: _ProfileOption(
            label: 'Notificações',
            vector: DesignVector.profileBell,
            iconOffset: 19,
            labelBaseline: 24,
            iconTop: 0,
          ),
        ),
        Positioned(
          left: 10,
          top: 424,
          width: 260,
          height: 34,
          child: _ProfileOption(
            label: 'Sobre nós',
            vector: DesignVector.profileAbout,
            iconOffset: 19,
            labelBaseline: 25,
            iconTop: 2,
          ),
        ),
        Positioned(
          left: 36,
          top: 480,
          width: 212,
          height: 43,
          child: HelixButton(
            label: 'SAIR',
            background: Color(0xFF960018),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.size,
    required this.innerSize,
    required this.borderWidth,
    required this.borderColor,
  });
  final double size;
  final double innerSize;
  final double borderWidth;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Foto de perfil',
      image: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        alignment: Alignment.center,
        child: Container(
          width: innerSize,
          height: innerSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _StaticIcon extends StatelessWidget {
  const _StaticIcon(this.vector, this.label);
  final DesignVector vector;
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    label: label,
    child: CustomPaint(painter: DesignVectorPainter(vector)),
  );
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.title,
    required this.description,
    required this.background,
    required this.titleBaseline,
    required this.bodyBaseline,
  });
  final String title;
  final String description;
  final Color background;
  final double titleBaseline;
  final double bodyBaseline;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 6,
            top: titleBaseline,
            width: 102,
            child: Baseline(
              baseline: 0,
              baselineType: TextBaseline.alphabetic,
              child: HelixText(
                title,
                size: 20,
                height: 23 / 20,
                color: HelixColors.cream,
              ),
            ),
          ),
          Positioned(
            left: 6,
            top: bodyBaseline,
            width: 103,
            child: Baseline(
              baseline: 0,
              baselineType: TextBaseline.alphabetic,
              child: HelixText(
                description,
                size: 11,
                height: 14 / 11,
                display: false,
                color: HelixColors.cream,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.label,
    required this.vector,
    required this.iconOffset,
    required this.labelBaseline,
    required this.iconTop,
  });
  final String label;
  final DesignVector vector;
  final double iconOffset;
  final double labelBaseline;
  final double iconTop;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 4,
          right: 0,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: HelixColors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: HelixColors.mediumBlue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          left: iconOffset,
          top: iconTop,
          width: 32,
          height: 32,
          child: CustomPaint(painter: DesignVectorPainter(vector)),
        ),
        Positioned(
          left: 62,
          top: labelBaseline,
          width: 197,
          child: Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: HelixText(label, size: 24),
          ),
        ),
      ],
    ),
  );
}
