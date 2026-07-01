# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 6.623 A
- tm_score_ca_ordered: 0.18212395930207093
- heavy_atom_rmsd: 7.730 A
- sidechain_heavy_atom_rmsd: 8.561 A
- **all-atom quality (honest):** heavy 7.730 A, sidechain 8.561 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 381
- bin_accuracy: 0.601

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.622805904534404
- ga_delta_rmsd: -1.7498902569523285  ga_fitness_mode: energy
- pre_local_rmsd: 6.64618706123889  localized_anchor_rmsd: 6.622886915870102

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1 → 119 conflicts (76%)
- explained: 119/156 conflicts by 1 root cause(s)
- metrics: hubs=28 (frac 0.596), conflicts/hub=5.6, max_incompat=10.08Å, chain_span=0.574
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1 — explain ~119/156 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L33** — severity 18.96, 9 conflict(s); suspect input ~`V30` (group: push_out)
  - push-out (wants farther): I1@26.4Å(now 11.8,conf 0.71), V2@26.3Å(now 18.2,conf 0.70)
  - I1↔V36: targets 26.4/5.8Å but partners are 11.6Å apart → too_close_together by 9.0Å
  - I1↔L29: targets 26.4/6.7Å but partners are 10.4Å apart → too_close_together by 9.3Å
  - I1↔V30: targets 26.4/5.7Å but partners are 12.5Å apart → too_close_together by 8.2Å
- **Y34** — severity 18.27, 12 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): N21@20.5Å(now 23.3,conf 0.42)
  - push-out (wants farther): V2@26.3Å(now 18.7,conf 0.70), I1@26.3Å(now 13.6,conf 0.70)
  - I1↔E31: targets 26.3/5.6Å but partners are 12.9Å apart → too_close_together by 7.8Å
  - I1↔C37: targets 26.3/6.4Å but partners are 11.2Å apart → too_close_together by 8.7Å
  - I1↔V30: targets 26.3/6.5Å but partners are 12.5Å apart → too_close_together by 7.3Å
- **V30** — severity 17.32, 10 conflict(s); suspect input ~`L33` (group: push_out)
  - push-out (wants farther): I1@27.1Å(now 12.5,conf 0.86), V2@27.0Å(now 17.5,conf 0.85)
  - I1↔L33: targets 27.1/5.7Å but partners are 11.8Å apart → too_close_together by 9.6Å
  - I1↔Y34: targets 27.1/6.5Å but partners are 13.6Å apart → too_close_together by 7.0Å
  - I1↔S27: targets 27.1/6.8Å but partners are 15.0Å apart → too_close_together by 5.3Å
- **L29** — severity 17.10, 11 conflict(s); suspect input ~`A32` (group: push_out)
  - push-out (wants farther): I1@27.1Å(now 10.4,conf 0.85), V2@26.9Å(now 16.9,conf 0.81), V20@13.2Å(now 10.2,conf 0.34)
  - I1↔A32: targets 27.1/6.0Å but partners are 11.8Å apart → too_close_together by 9.3Å
  - I1↔L33: targets 27.1/6.7Å but partners are 11.8Å apart → too_close_together by 8.6Å
  - I1↔G26: targets 27.1/7.0Å but partners are 14.1Å apart → too_close_together by 6.0Å
- **F42** — severity 14.16, 10 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@8.1Å(now 10.7,conf 0.35)
  - push-out (wants farther): V2@27.3Å(now 17.4,conf 0.92), I1@27.2Å(now 16.1,conf 0.90)
  - I1↔C37: targets 27.2/8.1Å but partners are 11.2Å apart → too_close_together by 7.9Å
  - V2↔P46: targets 27.3/12.0Å but partners are 8.6Å apart → too_close_together by 6.8Å
  - V2↔T45: targets 27.3/9.1Å but partners are 11.8Å apart → too_close_together by 6.4Å
- **G41** — severity 13.90, 10 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): N21@27.4Å(now 30.9,conf 0.95), C37@7.4Å(now 9.9,conf 0.36)
  - push-out (wants farther): V2@27.0Å(now 19.8,conf 0.84), I1@26.8Å(now 17.6,conf 0.79)
  - I1↔C37: targets 26.8/7.4Å but partners are 11.2Å apart → too_close_together by 8.2Å
  - V2↔Y44: targets 27.0/9.1Å but partners are 12.1Å apart → too_close_together by 5.8Å
  - I1↔Y44: targets 26.8/9.1Å but partners are 12.9Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=10 · 3-10(G)=3 · coil(C)=7

```
CHGEGHHHHHHHHHHHHHHGCEEHHEHEHHEHEHHHCCHEECCHCHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=13 · sheet=6
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - S11 ↔ L15  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - C25 ↔ L29  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ H23  (sheet)
  - Q22 ↔ H28  (sheet)
  - H23 ↔ H28  (sheet)
  - G26 ↔ E31  (sheet)
  - H28 ↔ L33  (sheet)

## Solvent Accessibility (burial)

- buried=22 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=171 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=86 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.3501 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
