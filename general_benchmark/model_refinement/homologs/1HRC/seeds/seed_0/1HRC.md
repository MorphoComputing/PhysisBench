# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1HRC\seeds\seed_0\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 11.525 A
- tm_score_ca_ordered: 0.15635827343175637
- heavy_atom_rmsd: 12.357 A
- sidechain_heavy_atom_rmsd: 13.209 A
- **all-atom quality (honest):** heavy 12.357 A, sidechain 13.209 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 1779
- bin_accuracy: 0.410

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.525352427033647
- ga_delta_rmsd: 0.4535944996026231  ga_fitness_mode: energy
- pre_local_rmsd: 11.57662292274059  localized_anchor_rmsd: 11.525361501243793

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F45-K59 → 1277 conflicts (70%); L97-T101 → 150 conflicts (8%)
- explained: 1427/1823 conflicts by 2 root cause(s)
- metrics: hubs=89 (frac 0.873), conflicts/hub=20.5, max_incompat=15.76Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F45-K59 + L97-T101 — explain ~1427/1823 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K7** — severity 161.15, 60 conflict(s); suspect input ~`K4` (group: pull_in)
  - pull-in (wants closer): K4@5.5Å(now 11.4,conf 0.45), V2@8.9Å(now 12.1,conf 0.34), D1@10.0Å(now 13.6,conf 0.34)
  - push-out (wants farther): K59@27.4Å(now 20.3,conf 0.96), D49@27.4Å(now 9.9,conf 0.95), K52@27.4Å(now 6.5,conf 0.94), E60@26.7Å(now 21.9,conf 0.78), A50@26.6Å(now 8.3,conf 0.75), T46@26.0Å(now 18.9,conf 0.65)
  - K52↔V10: targets 27.4/5.7Å but partners are 5.9Å apart → too_close_together by 15.8Å
  - D49↔V10: targets 27.4/5.7Å but partners are 7.2Å apart → too_close_together by 14.5Å
  - A50↔K4: targets 26.6/5.5Å but partners are 7.9Å apart → too_close_together by 13.2Å
- **L97** — severity 123.82, 64 conflict(s); suspect input ~`T101` (group: pull_in)
  - pull-in (wants closer): T101@5.5Å(now 11.5,conf 0.44), A100@5.8Å(now 10.0,conf 0.42)
  - push-out (wants farther): G22@27.5Å(now 24.9,conf 1.00), E20@27.5Å(now 20.6,conf 1.00), G23@27.5Å(now 24.8,conf 1.00), Y47@27.5Å(now 23.1,conf 0.98), K52@27.3Å(now 22.2,conf 0.93), F45@27.2Å(now 16.6,conf 0.90), T46@27.2Å(now 12.0,conf 0.88), N51@27.1Å(now 19.1,conf 0.86), A50@26.8Å(now 20.7,conf 0.80), K85@17.0Å(now 9.9,conf 0.35), G83@16.9Å(now 12.8,conf 0.35), K86@16.9Å(now 7.4,conf 0.35), N69@16.4Å(now 13.4,conf 0.35), N53@16.2Å(now 10.8,conf 0.35), K87@15.9Å(now 5.0,conf 0.34), K59@15.8Å(now 9.0,conf 0.34), D92@9.2Å(now 3.5,conf 0.34), E68@14.7Å(now 11.2,conf 0.34), I84@14.7Å(now 9.8,conf 0.34), R90@11.4Å(now 5.0,conf 0.34), E89@12.7Å(now 3.6,conf 0.34)
  - T46↔T101: targets 27.2/5.5Å but partners are 6.9Å apart → too_close_together by 14.7Å
  - E20↔T101: targets 27.5/5.5Å but partners are 9.9Å apart → too_close_together by 12.1Å
  - T46↔A100: targets 27.2/5.8Å but partners are 9.2Å apart → too_close_together by 12.2Å
- **K4** — severity 115.33, 41 conflict(s); suspect input ~`D1` (group: pull_in)
  - pull-in (wants closer): K7@5.5Å(now 11.4,conf 0.45), F9@8.2Å(now 11.2,conf 0.35), V10@9.8Å(now 13.9,conf 0.34)
  - push-out (wants farther): G76@27.5Å(now 24.5,conf 1.00), K72@27.5Å(now 22.5,conf 1.00), K71@27.5Å(now 23.9,conf 1.00), P75@27.5Å(now 22.8,conf 1.00), T48@27.5Å(now 10.7,conf 0.99), D49@27.5Å(now 11.9,conf 0.98), K59@27.4Å(now 9.2,conf 0.97), K52@27.4Å(now 9.4,conf 0.94), E60@27.3Å(now 13.1,conf 0.93), D1@5.7Å(now 3.1,conf 0.43), G55@16.8Å(now 9.2,conf 0.35), I56@13.8Å(now 9.2,conf 0.34), K12@12.3Å(now 9.6,conf 0.34)
  - K52↔K7: targets 27.4/5.5Å but partners are 6.5Å apart → too_close_together by 15.4Å
  - K59↔D1: targets 27.4/5.7Å but partners are 8.3Å apart → too_close_together by 13.5Å
  - T48↔K7: targets 27.5/5.5Å but partners are 9.4Å apart → too_close_together by 12.7Å
- **A100** — severity 106.35, 61 conflict(s); suspect input ~`W58` (group: pull_in)
  - pull-in (wants closer): L97@5.8Å(now 10.0,conf 0.42), Y96@6.5Å(now 12.6,conf 0.39), A95@8.7Å(now 13.2,conf 0.35), Q11@16.0Å(now 20.5,conf 0.34), W58@9.5Å(now 12.9,conf 0.34)
  - push-out (wants farther): D49@27.4Å(now 16.7,conf 0.96), K52@27.4Å(now 19.1,conf 0.95), F45@27.1Å(now 13.9,conf 0.86), T46@27.1Å(now 9.2,conf 0.85), N51@26.9Å(now 18.4,conf 0.83), A50@26.8Å(now 18.8,conf 0.81), K54@23.4Å(now 15.9,conf 0.50), C16@22.0Å(now 17.8,conf 0.46), E60@19.1Å(now 14.8,conf 0.38), T62@17.6Å(now 12.4,conf 0.36), Y66@17.6Å(now 8.6,conf 0.36), M64@16.5Å(now 11.5,conf 0.35), N53@16.0Å(now 12.4,conf 0.34), L67@16.0Å(now 8.4,conf 0.34), E89@15.9Å(now 9.9,conf 0.34), R90@15.7Å(now 10.3,conf 0.34), L63@14.4Å(now 11.3,conf 0.34)
  - T46↔W58: targets 27.1/9.5Å but partners are 5.8Å apart → too_close_together by 11.7Å
  - T46↔L97: targets 27.1/5.8Å but partners are 12.0Å apart → too_close_together by 9.3Å
  - T46↔G55: targets 27.1/11.7Å but partners are 4.1Å apart → too_close_together by 11.3Å
- **T101** — severity 97.63, 47 conflict(s); suspect input ~`W58` (group: pull_in)
  - pull-in (wants closer): L97@5.5Å(now 11.5,conf 0.44), K98@6.2Å(now 10.4,conf 0.40), W58@6.2Å(now 11.7,conf 0.40), Y96@8.2Å(now 13.4,conf 0.35), Q11@16.0Å(now 19.4,conf 0.34), A95@9.9Å(now 14.1,conf 0.34), E61@12.4Å(now 16.2,conf 0.34), I94@10.8Å(now 13.7,conf 0.19)
  - push-out (wants farther): F45@26.6Å(now 11.0,conf 0.74), T46@26.4Å(now 6.9,conf 0.71), N51@24.5Å(now 16.2,conf 0.55), A50@23.9Å(now 16.9,conf 0.52), C16@20.6Å(now 15.9,conf 0.42), K54@20.3Å(now 13.4,conf 0.41), E65@17.6Å(now 13.3,conf 0.36), E89@17.4Å(now 11.9,conf 0.35), R90@16.3Å(now 12.9,conf 0.35), Y66@16.1Å(now 11.3,conf 0.34), L67@15.2Å(now 11.5,conf 0.34)
  - T46↔W58: targets 26.4/6.2Å but partners are 5.8Å apart → too_close_together by 14.4Å
  - T46↔G55: targets 26.4/8.8Å but partners are 4.1Å apart → too_close_together by 13.4Å
  - F45↔W58: targets 26.6/6.2Å but partners are 8.9Å apart → too_close_together by 11.4Å
- **K98** — severity 96.28, 47 conflict(s); suspect input ~`T101` (group: pull_in)
  - pull-in (wants closer): A95@5.8Å(now 10.0,conf 0.42), T101@6.2Å(now 10.4,conf 0.40), E61@8.2Å(now 11.7,conf 0.35), W58@10.9Å(now 14.5,conf 0.34), I56@12.1Å(now 17.1,conf 0.34)
  - push-out (wants farther): G22@27.5Å(now 24.6,conf 1.00), E20@27.5Å(now 20.0,conf 0.99), F45@27.2Å(now 19.0,conf 0.89), T46@27.1Å(now 13.8,conf 0.88), N51@26.7Å(now 21.9,conf 0.78), A50@26.5Å(now 22.4,conf 0.74), K54@24.2Å(now 20.1,conf 0.53), K86@18.4Å(now 5.3,conf 0.37), I84@17.3Å(now 5.2,conf 0.35), K87@16.8Å(now 6.2,conf 0.35), E68@16.8Å(now 5.8,conf 0.35), K59@16.2Å(now 12.3,conf 0.35), E65@15.0Å(now 8.1,conf 0.34), Y66@14.6Å(now 6.8,conf 0.34), E89@14.6Å(now 4.6,conf 0.34), D92@10.2Å(now 7.2,conf 0.34), L63@10.4Å(now 7.5,conf 0.34), L67@13.4Å(now 3.8,conf 0.34), R90@13.2Å(now 3.1,conf 0.34), T62@13.0Å(now 10.4,conf 0.34), M64@12.3Å(now 6.2,conf 0.34)
  - T46↔T101: targets 27.1/6.2Å but partners are 6.9Å apart → too_close_together by 14.1Å
  - E20↔T101: targets 27.5/6.2Å but partners are 9.9Å apart → too_close_together by 11.4Å
  - F45↔T101: targets 27.2/6.2Å but partners are 11.0Å apart → too_close_together by 10.0Å

## Secondary Structure (DSSP-like)

- helix(H)=53 · strand(E)=33 · 3-10(G)=10 · coil(C)=6

```
EHHEEEHHEHEHEHECEEGHHHHEGHHHEHHHGEHHHEHEEHHHEHHEHEHHHHHHHGHHHGEHGCHCEEGCCHEHEHCHEGEGHEEHEHHEHHHEEGHHHE
```

## Backbone H-bond Network

- total=94 · helix(i→i+4)=26 · sheet=68
  - E3 ↔ K7  (helix)
  - I8 ↔ K12  (helix)
  - V10 ↔ A14  (helix)
  - G22 ↔ K26  (helix)
  - G23 ↔ T27  (helix)
  - K26 ↔ N30  (helix)
  - T27 ↔ L31  (helix)
  - G28 ↔ H32  (helix)
  - L31 ↔ F35  (helix)
  - H32 ↔ G36  (helix)
  - F35 ↔ T39  (helix)
  - T39 ↔ P43  (helix)
  - A42 ↔ T46  (helix)
  - P43 ↔ Y47  (helix)
  - Y47 ↔ N51  (helix)
  - D49 ↔ N53  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - N53 ↔ T57  (helix)
  - G55 ↔ K59  (helix)
  - … +74 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=67 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=466 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=245 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5371 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
