# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_7\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 6.624 A
- tm_score_ca_ordered: 0.13747863598017113
- heavy_atom_rmsd: 7.563 A
- sidechain_heavy_atom_rmsd: 7.851 A
- **all-atom quality (honest):** heavy 7.563 A, sidechain 7.851 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 251
- bin_accuracy: 0.518

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.6244406747727895
- ga_delta_rmsd: -2.4452071830908055  ga_fitness_mode: energy
- pre_local_rmsd: 6.624418331658883  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** P17 → 6 conflicts (38%); D36 → 4 conflicts (25%)
- explained: 10/16 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.324), conflicts/hub=1.3, max_incompat=4.29Å, chain_span=0.946
- **fix-first:** [LOW_CONFLICT] Root cause(s): P17 + D36 — explain ~10/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G24** — severity 7.23, 3 conflict(s); suspect input ~`P17` (group: pull_in)
  - pull-in (wants closer): D36@17.1Å(now 19.8,conf 0.55)
  - push-out (wants farther): P17@17.0Å(now 13.2,conf 0.99), C10@9.3Å(now 5.9,conf 0.55)
  - P17↔C28: targets 17.0/9.0Å but partners are 4.7Å apart → too_close_together by 3.3Å
  - P17↔Y27: targets 17.0/7.1Å but partners are 7.3Å apart → too_close_together by 2.5Å
  - P17↔G29: targets 17.0/8.8Å but partners are 6.1Å apart → too_close_together by 2.0Å
- **I6** — severity 5.63, 3 conflict(s); suspect input ~`D36` (group: pull_in)
  - pull-in (wants closer): P31@5.9Å(now 10.0,conf 0.55)
  - push-out (wants farther): V2@10.5Å(now 6.9,conf 0.82), G1@13.3Å(now 10.3,conf 0.55), D36@15.8Å(now 12.6,conf 0.55)
  - P31↔D36: targets 5.9/15.8Å but partners are 6.1Å apart → too_close_together by 3.9Å
  - P31↔G1: targets 5.9/13.3Å but partners are 4.2Å apart → too_close_together by 3.2Å
  - D33↔D36: targets 8.3/15.8Å but partners are 4.3Å apart → too_close_together by 3.2Å
- **N25** — severity 2.34, 1 conflict(s); suspect input ~`C28` (group: pull_in)
  - pull-in (wants closer): D36@15.5Å(now 21.4,conf 0.55)
  - push-out (wants farther): P17@17.1Å(now 13.4,conf 0.55), Q8@11.0Å(now 5.3,conf 0.55)
  - P17↔C28: targets 17.1/8.2Å but partners are 4.7Å apart → too_close_together by 4.3Å
- **C16** — severity 2.04, 1 conflict(s); suspect input ~`C20` (group: push_out)
  - push-out (wants farther): D36@20.3Å(now 17.6,conf 0.59), Y27@8.7Å(now 6.0,conf 0.55)
  - D36↔C20: targets 20.3/5.2Å but partners are 11.5Å apart → too_close_together by 3.6Å
- **D36** — severity 1.83, 1 conflict(s); suspect input ~`A19` (group: pull_in)
  - pull-in (wants closer): G24@17.1Å(now 19.8,conf 0.55), N25@15.5Å(now 21.4,conf 0.55), R23@15.7Å(now 18.4,conf 0.55)
  - push-out (wants farther): P31@10.0Å(now 6.1,conf 0.72), C16@20.3Å(now 17.6,conf 0.59), A19@18.0Å(now 11.8,conf 0.55), D33@9.0Å(now 4.3,conf 0.55), Y32@9.5Å(now 4.2,conf 0.55), I6@15.8Å(now 12.6,conf 0.55)
  - Y30↔A19: targets 9.1/18.0Å but partners are 5.6Å apart → too_close_together by 3.3Å
- **D15** — severity 1.56, 1 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): I21@7.0Å(now 4.2,conf 0.94), C22@7.1Å(now 3.8,conf 0.94), G29@11.2Å(now 6.8,conf 0.55), Y30@14.3Å(now 10.1,conf 0.55), Y27@10.0Å(now 6.7,conf 0.55)
  - C20↔Y30: targets 7.4/14.3Å but partners are 4.0Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=18 · 3-10(G)=2 · coil(C)=3

```
EEHEGEEEECHEEHHEEHHHCHHEHHECEEEEGHHHE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=3 · sheet=50
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - C22 ↔ G26  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ P17  (sheet)
  - V2 ↔ L7  (sheet)
  - V2 ↔ Q8  (sheet)
  - V2 ↔ R9  (sheet)
  - V2 ↔ P17  (sheet)
  - P4 ↔ P17  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ P17  (sheet)
  - L7 ↔ C16  (sheet)
  - L7 ↔ P17  (sheet)
  - L7 ↔ G24  (sheet)
  - L7 ↔ Y27  (sheet)
  - Q8 ↔ D13  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=189 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7764 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
