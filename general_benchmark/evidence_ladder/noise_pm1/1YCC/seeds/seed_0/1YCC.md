# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1YCC\seeds\seed_0\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.766 A
- tm_score_ca_ordered: 0.9635506366010482
- heavy_atom_rmsd: 2.905 A
- sidechain_heavy_atom_rmsd: 3.846 A
- **all-atom quality (honest):** heavy 2.905 A, sidechain 3.846 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3282
- bin_accuracy: 0.640

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.9882901774904022 -> 0.8946677509432939 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7655219369172753
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.7830166612435336  localized_anchor_rmsd: 0.765504987599757

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T97-L99 → 29 conflicts (23%); F14-T16 → 20 conflicts (16%); D64-N66 → 17 conflicts (14%)
- explained: 66/126 conflicts by 3 root cause(s)
- metrics: hubs=41 (frac 0.398), conflicts/hub=3.1, max_incompat=4.68Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T97-L99 + F14-T16 + D64-N66 — explain ~66/126 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L99** — severity 9.30, 11 conflict(s); suspect input ~`R92` (group: push_out)
  - pull-in (wants closer): E70@12.7Å(now 15.2,conf 0.34), R92@7.7Å(now 10.3,conf 0.36)
  - push-out (wants farther): S6@12.6Å(now 9.7,conf 0.34), K8@12.2Å(now 9.0,conf 0.34)
  - E25↔R92: targets 8.2/7.7Å but partners are 20.0Å apart → too_far_apart by 4.1Å
  - E89↔R92: targets 15.8/7.7Å but partners are 4.9Å apart → too_close_together by 3.1Å
  - C103↔R92: targets 5.0/7.7Å but partners are 15.5Å apart → too_far_apart by 2.8Å
- **G10** — severity 5.72, 8 conflict(s); suspect input ~`T16` (group: pull_in)
  - pull-in (wants closer): T16@7.8Å(now 10.3,conf 0.36)
  - G5↔T16: targets 8.1/7.8Å but partners are 18.4Å apart → too_far_apart by 2.6Å
  - K3↔T16: targets 12.2/7.8Å but partners are 22.5Å apart → too_far_apart by 2.5Å
  - T97↔T16: targets 6.1/7.8Å but partners are 16.1Å apart → too_far_apart by 2.2Å
- **C103** — severity 5.26, 5 conflict(s); suspect input ~`G5` (group: pull_in)
  - pull-in (wants closer): K31@13.6Å(now 16.4,conf 0.34)
  - push-out (wants farther): G5@18.4Å(now 14.3,conf 0.37)
  - L99↔G5: targets 5.0/18.4Å but partners are 10.0Å apart → too_close_together by 3.5Å
  - K100↔G5: targets 6.0/18.4Å but partners are 9.3Å apart → too_close_together by 3.1Å
  - G5↔T97: targets 18.4/9.8Å but partners are 5.3Å apart → too_close_together by 3.3Å
- **G41** — severity 5.23, 6 conflict(s); suspect input ~`N66` (group: push_out)
  - pull-in (wants closer): G84@21.9Å(now 24.8,conf 0.46), S69@12.5Å(now 15.1,conf 0.34)
  - push-out (wants farther): E1@18.1Å(now 14.8,conf 0.36), F2@18.2Å(now 15.6,conf 0.37)
  - E1↔N66: targets 18.1/10.6Å but partners are 4.4Å apart → too_close_together by 3.2Å
  - D64↔E1: targets 6.2/18.1Å but partners are 9.0Å apart → too_close_together by 2.9Å
  - E65↔F2: targets 9.2/18.2Å but partners are 6.3Å apart → too_close_together by 2.7Å
- **H37** — severity 4.45, 6 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): G84@20.7Å(now 23.3,conf 0.42), D64@10.7Å(now 13.5,conf 0.34)
  - D64↔G27: targets 10.7/7.1Å but partners are 20.7Å apart → too_far_apart by 2.9Å
  - D64↔G28: targets 10.7/7.3Å but partners are 20.5Å apart → too_far_apart by 2.5Å
  - G84↔K26: targets 20.7/5.2Å but partners are 27.5Å apart → too_far_apart by 1.6Å
- **T16** — severity 4.08, 5 conflict(s); suspect input ~`A7` (group: push_out)
  - pull-in (wants closer): D91@10.0Å(now 12.9,conf 0.34), G10@7.8Å(now 10.3,conf 0.36)
  - push-out (wants farther): A82@15.8Å(now 13.1,conf 0.34)
  - A7↔G10: targets 16.6/7.8Å but partners are 4.5Å apart → too_close_together by 4.3Å
  - K90↔D91: targets 16.6/10.0Å but partners are 4.3Å apart → too_close_together by 2.3Å
  - T97↔G10: targets 16.5/7.8Å but partners are 6.7Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=36 · 3-10(G)=19 · coil(C)=11

```
EEECEEEHHHHGHHEGECHHEEEGEHCEEGEHECGGEHHGHEEEGCHCCECEGEHEHCEGEGGEHEHHHHHHHCEGCGEHHHEHEGGEGHHEHGHHGHHHEHE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=11 · sheet=55
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - K80 ↔ G84  (helix)
  - D91 ↔ L95  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - Y98 ↔ A102  (helix)
  - A7 ↔ K15  (sheet)
  - K15 ↔ C21  (sheet)
  - K15 ↔ H22  (sheet)
  - K15 ↔ T23  (sheet)
  - R17 ↔ H22  (sheet)
  - R17 ↔ T23  (sheet)
  - R17 ↔ G33  (sheet)
  - C21 ↔ G28  (sheet)
  - C21 ↔ P29  (sheet)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=383 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=167 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.079 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
