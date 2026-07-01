# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1ENH\seeds\seed_1\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 2.018 A
- tm_score_ca_ordered: 0.6634209639069214
- heavy_atom_rmsd: 3.788 A
- sidechain_heavy_atom_rmsd: 4.757 A
- **all-atom quality (honest):** heavy 3.788 A, sidechain 4.757 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1225
- bin_accuracy: 0.305

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=3.452911219121931 -> 2.8042622422371597 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0184626850207708
- ga_delta_rmsd: 0.3433455558826388  ga_fitness_mode: energy
- pre_local_rmsd: 2.0432688222577635  localized_anchor_rmsd: 2.018444162680133

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L13-N18 → 259 conflicts (40%); F46-Q47 → 97 conflicts (15%); S32 → 59 conflicts (9%)
- explained: 415/648 conflicts by 3 root cause(s)
- metrics: hubs=52 (frac 1.0), conflicts/hub=12.5, max_incompat=10.95Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L13-N18 + F46-Q47 + S32 — explain ~415/648 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L13** — severity 29.70, 39 conflict(s); suspect input ~`N20` (group: push_out)
  - pull-in (wants closer): E8@5.7Å(now 8.8,conf 0.38), N20@6.4Å(now 10.7,conf 0.31), T24@9.4Å(now 12.6,conf 0.17), S7@5.9Å(now 9.7,conf 0.36), G36@8.5Å(now 11.5,conf 0.20), K49@6.1Å(now 11.3,conf 0.34)
  - push-out (wants farther): L10@9.0Å(now 4.7,conf 0.18), E16@9.3Å(now 4.8,conf 0.18), A4@16.6Å(now 12.4,conf 0.15), Q29@17.1Å(now 11.9,conf 0.16), R27@16.3Å(now 10.4,conf 0.15), T3@17.6Å(now 12.4,conf 0.17)
  - N20↔S7: targets 6.4/5.9Å but partners are 19.4Å apart → too_far_apart by 7.1Å
  - E8↔N20: targets 5.7/6.4Å but partners are 18.7Å apart → too_far_apart by 6.6Å
  - E8↔K49: targets 5.7/6.1Å but partners are 16.5Å apart → too_far_apart by 4.8Å
- **N18** — severity 23.52, 26 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): P1@19.6Å(now 22.3,conf 0.22), R28@7.1Å(now 13.9,conf 0.27), W45@8.7Å(now 11.7,conf 0.20)
  - push-out (wants farther): S6@22.4Å(now 16.9,conf 0.33), F5@21.1Å(now 17.6,conf 0.27), E25@23.4Å(now 16.5,conf 0.39), S32@21.4Å(now 17.2,conf 0.28), K43@17.7Å(now 13.4,conf 0.17), R50@17.6Å(now 8.7,conf 0.17), T24@16.6Å(now 13.6,conf 0.15), R27@17.1Å(now 14.1,conf 0.16)
  - E25↔R28: targets 23.4/7.1Å but partners are 5.4Å apart → too_close_together by 10.9Å
  - S32↔R28: targets 21.4/7.1Å but partners are 5.9Å apart → too_close_together by 8.5Å
  - R21↔E25: targets 6.1/23.4Å but partners are 11.7Å apart → too_close_together by 5.7Å
- **S32** — severity 22.95, 37 conflict(s); suspect input ~`P1` (group: pull_in)
  - pull-in (wants closer): Y22@9.4Å(now 14.8,conf 0.17), F5@8.5Å(now 11.1,conf 0.20), S6@9.5Å(now 13.1,conf 0.17), T24@8.6Å(now 12.2,conf 0.20)
  - push-out (wants farther): L35@9.9Å(now 5.9,conf 0.16), N18@21.4Å(now 17.2,conf 0.28), P1@20.5Å(now 13.9,conf 0.24), F46@16.6Å(now 12.7,conf 0.15), R2@16.6Å(now 13.6,conf 0.15), A4@18.8Å(now 14.1,conf 0.20), S7@20.2Å(now 16.2,conf 0.23), N20@19.7Å(now 15.6,conf 0.22)
  - E39↔P1: targets 5.6/20.5Å but partners are 8.9Å apart → too_close_together by 6.0Å
  - A4↔F5: targets 18.8/8.5Å but partners are 4.0Å apart → too_close_together by 6.3Å
  - P1↔Q41: targets 20.5/8.1Å but partners are 6.7Å apart → too_close_together by 5.7Å
- **N20** — severity 16.18, 19 conflict(s); suspect input ~`L13` (group: pull_in)
  - pull-in (wants closer): F5@17.7Å(now 20.3,conf 0.17), R50@8.5Å(now 11.9,conf 0.20), L13@6.4Å(now 10.7,conf 0.31)
  - push-out (wants farther): L37@22.6Å(now 19.1,conf 0.33), S33@20.4Å(now 17.1,conf 0.24), I44@18.2Å(now 15.1,conf 0.18), T24@10.2Å(now 7.3,conf 0.15), S32@19.7Å(now 15.6,conf 0.22)
  - S6↔L13: targets 22.7/6.4Å but partners are 10.0Å apart → too_close_together by 6.3Å
  - L37↔L13: targets 22.6/6.4Å but partners are 10.9Å apart → too_close_together by 5.2Å
  - Q9↔L13: targets 19.5/6.4Å but partners are 6.9Å apart → too_close_together by 6.2Å
- **R15** — severity 15.31, 21 conflict(s); suspect input ~`L37` (group: pull_in)
  - pull-in (wants closer): Q30@9.8Å(now 13.7,conf 0.16), L37@8.3Å(now 15.6,conf 0.21)
  - push-out (wants farther): P1@24.6Å(now 21.6,conf 0.48), A11@6.7Å(now 4.0,conf 0.29), E25@19.6Å(now 16.0,conf 0.22), A51@20.3Å(now 15.3,conf 0.24), S33@20.1Å(now 14.3,conf 0.23), W45@16.4Å(now 11.7,conf 0.15), Q41@21.4Å(now 15.1,conf 0.28), K52@18.1Å(now 14.8,conf 0.18), T24@18.6Å(now 13.9,conf 0.19), R28@16.6Å(now 12.0,conf 0.15)
  - Q41↔L37: targets 21.4/8.3Å but partners are 6.8Å apart → too_close_together by 6.3Å
  - A51↔K49: targets 20.3/10.2Å but partners are 3.1Å apart → too_close_together by 6.9Å
  - P1↔L37: targets 24.6/8.3Å but partners are 11.3Å apart → too_close_together by 5.0Å
- **Q47** — severity 14.44, 22 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R21@6.3Å(now 9.2,conf 0.32), N38@10.1Å(now 14.7,conf 0.16), R28@8.7Å(now 14.5,conf 0.19), A4@10.3Å(now 13.2,conf 0.15), Q41@7.0Å(now 10.1,conf 0.27)
  - push-out (wants farther): G36@23.2Å(now 18.3,conf 0.37), S6@18.1Å(now 15.5,conf 0.18), A51@8.7Å(now 5.0,conf 0.19), A11@20.8Å(now 12.2,conf 0.26), Q9@18.2Å(now 14.3,conf 0.18)
  - G36↔I42: targets 23.2/6.7Å but partners are 9.6Å apart → too_close_together by 6.8Å
  - G36↔Q41: targets 23.2/7.0Å but partners are 10.7Å apart → too_close_together by 5.4Å
  - R28↔Q29: targets 8.7/20.8Å but partners are 4.8Å apart → too_close_together by 7.3Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=18 · 3-10(G)=6 · coil(C)=0

```
EEGHEEHHEGHHHHEHHHEHHEGHHEHHHEHHEGEGEEHHEHHHEHEHGHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=18 · sheet=15
  - A4 ↔ E8  (helix)
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - E16 ↔ N20  (helix)
  - F17 ↔ R21  (helix)
  - N20 ↔ T24  (helix)
  - R21 ↔ E25  (helix)
  - T24 ↔ R28  (helix)
  - E25 ↔ Q29  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - E39 ↔ K43  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - Q9 ↔ R15  (sheet)
  - R15 ↔ L35  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=163 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=33 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8347 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
