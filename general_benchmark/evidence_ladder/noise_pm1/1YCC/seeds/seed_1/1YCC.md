# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1YCC\seeds\seed_1\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.752 A
- tm_score_ca_ordered: 0.9644288786910102
- heavy_atom_rmsd: 2.992 A
- sidechain_heavy_atom_rmsd: 4.017 A
- **all-atom quality (honest):** heavy 2.992 A, sidechain 4.017 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3282
- bin_accuracy: 0.641

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=57
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=0.9823051228485213 -> 0.8390869629646106 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7523480244093381
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.768842302471966  localized_anchor_rmsd: 0.7523968928439919

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D64-M68 → 25 conflicts (23%); D91-R92 → 23 conflicts (21%); M81-F83 → 13 conflicts (12%)
- explained: 61/110 conflicts by 3 root cause(s)
- metrics: hubs=38 (frac 0.369), conflicts/hub=2.9, max_incompat=4.61Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D64-M68 + D91-R92 + M81-F83 — explain ~61/110 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L99** — severity 7.94, 9 conflict(s); suspect input ~`R92` (group: pull_in)
  - pull-in (wants closer): R92@7.7Å(now 10.4,conf 0.36)
  - push-out (wants farther): S6@12.6Å(now 9.7,conf 0.34), K8@12.2Å(now 9.1,conf 0.34)
  - E25↔R92: targets 8.2/7.7Å but partners are 20.1Å apart → too_far_apart by 4.2Å
  - E89↔R92: targets 15.8/7.7Å but partners are 4.9Å apart → too_close_together by 3.1Å
  - C103↔R92: targets 5.0/7.7Å but partners are 15.5Å apart → too_far_apart by 2.9Å
- **C103** — severity 5.26, 5 conflict(s); suspect input ~`G5` (group: pull_in)
  - pull-in (wants closer): K31@13.6Å(now 16.4,conf 0.34)
  - push-out (wants farther): G5@18.4Å(now 14.3,conf 0.37)
  - L99↔G5: targets 5.0/18.4Å but partners are 10.0Å apart → too_close_together by 3.5Å
  - K100↔G5: targets 6.0/18.4Å but partners are 9.3Å apart → too_close_together by 3.2Å
  - G5↔T97: targets 18.4/9.8Å but partners are 5.3Å apart → too_close_together by 3.3Å
- **G41** — severity 5.12, 6 conflict(s); suspect input ~`N66` (group: push_out)
  - pull-in (wants closer): G84@21.9Å(now 24.8,conf 0.46), S69@12.5Å(now 15.1,conf 0.34)
  - push-out (wants farther): E1@18.1Å(now 14.9,conf 0.36), F2@18.2Å(now 15.6,conf 0.37)
  - D64↔E1: targets 6.2/18.1Å but partners are 9.1Å apart → too_close_together by 2.8Å
  - E1↔N66: targets 18.1/10.6Å but partners are 4.5Å apart → too_close_together by 3.0Å
  - E65↔F2: targets 9.2/18.2Å but partners are 6.3Å apart → too_close_together by 2.6Å
- **H37** — severity 5.12, 7 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): G84@20.7Å(now 23.2,conf 0.42), D64@10.7Å(now 13.6,conf 0.34)
  - D64↔G27: targets 10.7/7.1Å but partners are 20.8Å apart → too_far_apart by 3.0Å
  - D64↔G28: targets 10.7/7.3Å but partners are 20.7Å apart → too_far_apart by 2.7Å
  - K26↔D64: targets 5.2/10.7Å but partners are 18.0Å apart → too_far_apart by 2.0Å
- **G5** — severity 4.61, 5 conflict(s); suspect input ~`C103` (group: push_out)
  - pull-in (wants closer): D54@27.5Å(now 30.8,conf 0.98), G49@27.5Å(now 30.2,conf 0.98), S51@27.5Å(now 30.7,conf 0.98), T53@27.3Å(now 30.3,conf 0.92)
  - push-out (wants farther): F40@18.2Å(now 15.7,conf 0.37), C103@18.4Å(now 14.3,conf 0.37)
  - T97↔C103: targets 5.5/18.4Å but partners are 9.2Å apart → too_close_together by 3.8Å
  - L99↔C103: targets 9.9/18.4Å but partners are 5.3Å apart → too_close_together by 3.2Å
  - K100↔C103: targets 10.4/18.4Å but partners are 5.4Å apart → too_close_together by 2.7Å
- **F14** — severity 3.95, 5 conflict(s); suspect input ~`L72` (group: pull_in)
  - pull-in (wants closer): L72@8.4Å(now 12.0,conf 0.35)
  - E70↔L72: targets 16.8/8.4Å but partners are 5.1Å apart → too_close_together by 3.3Å
  - Y71↔L72: targets 14.8/8.4Å but partners are 3.5Å apart → too_close_together by 2.9Å
  - A11↔L72: targets 5.0/8.4Å but partners are 15.6Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=30 · 3-10(G)=21 · coil(C)=15

```
CEEEEEGHHHHGHHCGECHHCEEGEHCEEGEHECGGEHHCHEEECCHGCECEGEHEHCEGEGGEHEHHHHHHHCEGCGEHHHEHEGGEGHHGHGHGGHHHHHC
```

## Backbone H-bond Network

- total=57 · helix(i→i+4)=10 · sheet=47
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - K80 ↔ G84  (helix)
  - D91 ↔ L95  (helix)
  - L95 ↔ L99  (helix)
  - Y98 ↔ A102  (helix)
  - R17 ↔ H22  (sheet)
  - R17 ↔ T23  (sheet)
  - R17 ↔ G33  (sheet)
  - H22 ↔ G28  (sheet)
  - H22 ↔ P29  (sheet)
  - H22 ↔ K31  (sheet)
  - H22 ↔ G33  (sheet)
  - H22 ↔ H37  (sheet)
  - T23 ↔ G28  (sheet)
  - T23 ↔ P29  (sheet)
  - … +37 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=379 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0793 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
