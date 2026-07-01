# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 5.530 A
- tm_score_ca_ordered: 0.21405311080639752
- heavy_atom_rmsd: 6.615 A
- sidechain_heavy_atom_rmsd: 7.476 A
- **all-atom quality (honest):** heavy 6.615 A, sidechain 7.476 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 381
- bin_accuracy: 0.596

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=19 rmsd=8.16923387696098 -> 5.486123638997775 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.529598607354038
- ga_delta_rmsd: -3.0273213797249774  ga_fitness_mode: energy
- pre_local_rmsd: 5.780749888150812  localized_anchor_rmsd: 5.52958554568544

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1 → 60 conflicts (73%); V2-P46 → 6 conflicts (7%); V2-Y44 → 5 conflicts (6%)
- explained: 71/82 conflicts by 3 root cause(s)
- metrics: hubs=23 (frac 0.489), conflicts/hub=3.6, max_incompat=11.14Å, chain_span=0.574
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1 + V2-P46 + V2-Y44 — explain ~71/82 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F42** — severity 12.53, 7 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): V2@27.3Å(now 18.4,conf 0.92), I1@27.2Å(now 16.4,conf 0.90), C25@25.6Å(now 23.1,conf 0.64), L29@18.1Å(now 15.5,conf 0.36)
  - V2↔P46: targets 27.3/12.0Å but partners are 7.5Å apart → too_close_together by 7.8Å
  - V2↔T45: targets 27.3/9.1Å but partners are 10.9Å apart → too_close_together by 7.3Å
  - I1↔T45: targets 27.2/9.1Å but partners are 12.3Å apart → too_close_together by 5.8Å
- **F43** — severity 11.37, 4 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): V2@27.4Å(now 16.3,conf 0.96), I1@27.4Å(now 15.5,conf 0.94)
  - V2↔P46: targets 27.4/9.2Å but partners are 7.5Å apart → too_close_together by 10.7Å
  - V2↔K47: targets 27.4/11.1Å but partners are 7.4Å apart → too_close_together by 8.9Å
  - I1↔P46: targets 27.4/9.2Å but partners are 9.7Å apart → too_close_together by 8.5Å
- **G41** — severity 11.23, 9 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): C37@7.4Å(now 10.1,conf 0.36)
  - push-out (wants farther): V2@27.0Å(now 21.8,conf 0.84), I1@26.8Å(now 19.6,conf 0.79)
  - I1↔Y44: targets 26.8/9.1Å but partners are 11.4Å apart → too_close_together by 6.3Å
  - V2↔Y44: targets 27.0/9.1Å but partners are 12.3Å apart → too_close_together by 5.7Å
  - V2↔P46: targets 27.0/15.1Å but partners are 7.5Å apart → too_close_together by 4.4Å
- **Y34** — severity 8.70, 7 conflict(s); suspect input ~`Y44` (group: push_out)
  - push-out (wants farther): V2@26.3Å(now 21.6,conf 0.70), I1@26.3Å(now 17.6,conf 0.70)
  - I1↔V30: targets 26.3/6.5Å but partners are 15.1Å apart → too_close_together by 4.6Å
  - I1↔L29: targets 26.3/8.9Å but partners are 13.1Å apart → too_close_together by 4.2Å
  - I1↔E31: targets 26.3/5.6Å but partners are 17.5Å apart → too_close_together by 3.2Å
- **V30** — severity 8.46, 7 conflict(s); suspect input ~`S27` (group: push_out)
  - push-out (wants farther): I1@27.1Å(now 15.1,conf 0.86), V2@27.0Å(now 19.7,conf 0.85)
  - I1↔S27: targets 27.1/6.8Å but partners are 15.2Å apart → too_close_together by 5.1Å
  - I1↔L33: targets 27.1/5.7Å but partners are 17.1Å apart → too_close_together by 4.2Å
  - I1↔G26: targets 27.1/8.7Å but partners are 14.2Å apart → too_close_together by 4.2Å
- **L33** — severity 7.13, 4 conflict(s); suspect input ~`L29` (group: push_out)
  - push-out (wants farther): I1@26.4Å(now 17.1,conf 0.71), V2@26.3Å(now 21.9,conf 0.70)
  - I1↔L29: targets 26.4/6.7Å but partners are 13.1Å apart → too_close_together by 6.6Å
  - I1↔V30: targets 26.4/5.7Å but partners are 15.1Å apart → too_close_together by 5.5Å
  - I1↔V36: targets 26.4/5.8Å but partners are 17.6Å apart → too_close_together by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=14 · 3-10(G)=6 · coil(C)=7

```
CEGEGHEHHHEHEGHHHHHGGEEHHEHHHHEHEHCEHCHEECCCEGC
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=5 · sheet=18
  - C6 ↔ C10  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - C25 ↔ L29  (helix)
  - V30 ↔ Y34  (helix)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Y13  (sheet)
  - T7 ↔ Y13  (sheet)
  - T7 ↔ Q22  (sheet)
  - T7 ↔ H23  (sheet)
  - T7 ↔ G26  (sheet)
  - S11 ↔ Q22  (sheet)
  - S11 ↔ H23  (sheet)
  - S11 ↔ G26  (sheet)
  - Y13 ↔ Q22  (sheet)
  - Y13 ↔ H23  (sheet)
  - Y13 ↔ G26  (sheet)
  - Y13 ↔ E31  (sheet)
  - Y13 ↔ L33  (sheet)
  - G26 ↔ E31  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=140 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0044 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
